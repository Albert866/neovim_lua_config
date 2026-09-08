-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
--
-- Add any additional autocmds here
-- with `vim.api.nvim_create_autocmd`
--
-- Or remove existing autocmds by their group name (which is prefixed with `lazyvim_` for the defaults)

local conventional_commit_group = vim.api.nvim_create_augroup("conventional_commit", { clear = true })

vim.api.nvim_create_autocmd("FileType", {
  group = conventional_commit_group,
  pattern = "gitcommit",
  callback = function(event)
    local commit_types = {
      { name = "feat", description = "新功能" },
      { name = "fix", description = "缺陷修复" },
      { name = "docs", description = "文档" },
      { name = "refactor", description = "重构" },
      { name = "test", description = "测试" },
      { name = "build", description = "构建或依赖" },
      { name = "ci", description = "持续集成" },
      { name = "chore", description = "其他维护" },
      { name = "perf", description = "性能优化" },
      { name = "revert", description = "回退提交" },
    }

    local function insert_commit_prefix()
      vim.ui.select(commit_types, {
        prompt = "Conventional Commit type",
        format_item = function(item)
          return string.format("%-10s %s", item.name, item.description)
        end,
      }, function(item)
        if not item then
          return
        end

        vim.ui.input({ prompt = "Scope（可留空）: " }, function(scope)
          if scope == nil then
            return
          end

          scope = vim.trim(scope)
          local prefix = scope == "" and (item.name .. ": ") or (item.name .. "(" .. scope .. "): ")
          local row, column = unpack(vim.api.nvim_win_get_cursor(0))
          vim.api.nvim_buf_set_text(event.buf, row - 1, column, row - 1, column, { prefix })
          vim.api.nvim_win_set_cursor(0, { row, column + #prefix })
          vim.cmd.startinsert()
        end)
      end)
    end

    local function insert_commit_help()
      local lines = vim.api.nvim_buf_get_lines(event.buf, 0, math.min(10, vim.api.nvim_buf_line_count(event.buf)), false)
      for _, line in ipairs(lines) do
        if line == "# Conventional Commits: type(scope): subject" then
          vim.notify("Conventional Commits 提示已存在", vim.log.levels.INFO)
          return
        end
      end

      vim.api.nvim_buf_set_lines(event.buf, 0, 0, false, {
        "# Conventional Commits: type(scope): subject",
        "# type: feat fix docs refactor test build ci chore perf revert",
        "# scope 可留空；subject 使用祈使句、首字母小写，末尾不加句号",
        "",
      })
    end

    vim.keymap.set("n", "<leader>ct", insert_commit_prefix, {
      buffer = event.buf,
      desc = "Commit: 选择 Conventional Commit 类型",
    })
    vim.keymap.set("n", "<leader>cc", insert_commit_help, {
      buffer = event.buf,
      desc = "Commit: 插入 Conventional Commits 提示",
    })
  end,
})
-- e.g. vim.api.nvim_del_augroup_by_name("lazyvim_wrap_spell")
