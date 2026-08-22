-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
vim.keymap.set({ "n", "t" }, "<leader>ao", function()
  if vim.fn.executable("codex") ~= 1 then
    vim.notify("Codex CLI was not found in PATH", vim.log.levels.ERROR)
    return
  end

  Snacks.terminal({ "codex" }, {
    cwd = LazyVim.root(),
    count = 1,
    interactive = true,
    win = {
      style = "terminal",
      position = "right",
      width = 0.4,
      height = 0,
      enter = true,
      backdrop = false,
      wo = { winbar = " Codex " },
    },
  })
end, { desc = "Toggle Codex (right side)" })

vim.keymap.set("n", "s", "s", { noremap = true })
vim.keymap.set("n", "S", "S", { noremap = true })
vim.keymap.set("v", "s", "s", { noremap = true })
vim.keymap.set("v", "S", "S", { noremap = true })
