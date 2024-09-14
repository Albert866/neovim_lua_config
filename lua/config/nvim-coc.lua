-- nvim-coc.lua config

-- 禁用启动警告
vim.g.coc_disable_startup_warning = 1

-- 设置一些基本选项
vim.opt.backup = false
vim.opt.writebackup = false
vim.opt.updatetime = 300
vim.opt.signcolumn = "yes"

-- 使用 Tab 键触发补全和导航
vim.api.nvim_set_keymap('i', '<TAB>', 'coc#pum#visible() ? coc#pum#next(1) : v:lua.check_backspace() ? "<Tab>" : coc#refresh()', { noremap = true, silent = true, expr = true })
vim.api.nvim_set_keymap('i', '<S-TAB>', 'coc#pum#visible() ? coc#pum#prev(1) : "<C-h>"', { noremap = true, silent = true, expr = true })

-- 使用 Enter 键确认补全
vim.api.nvim_set_keymap('i', '<CR>', 'coc#pum#visible() ? coc#pum#confirm() : "<C-g>u<CR><c-r>=coc#on_enter()<CR>"', { noremap = true, silent = true, expr = true })

-- 检查是否为退格键
_G.check_backspace = function()
  local col = vim.fn.col('.') - 1
  return col == 0 or vim.fn.getline('.'):sub(col, col):match('%s') ~= nil
end

-- 使用 <c-space> 触发补全
vim.api.nvim_set_keymap('i', '<c-space>', 'coc#refresh()', { noremap = true, silent = true, expr = true })

-- 使用 <cr> 确认补全
vim.api.nvim_set_keymap('i', '<cr>', 'pumvisible() ? "<C-y>" : "<C-g>u<CR>"', { noremap = true, silent = true, expr = true })

-- 使用 `gN` 和 `gn` 导航诊断信息
vim.api.nvim_set_keymap('n', 'gN', '<Plug>(coc-diagnostic-prev)', { silent = true })
vim.api.nvim_set_keymap('n', 'gn', '<Plug>(coc-diagnostic-next)', { silent = true })

-- 重新映射键用于跳转
vim.api.nvim_set_keymap('n', 'gd', '<Plug>(coc-definition)', { silent = true })
vim.api.nvim_set_keymap('n', 'gy', '<Plug>(coc-type-definition)', { silent = true })
vim.api.nvim_set_keymap('n', 'gi', '<Plug>(coc-implementation)', { silent = true })
vim.api.nvim_set_keymap('n', 'gr', '<Plug>(coc-references)', { silent = true })

-- 使用 K 显示文档
vim.api.nvim_set_keymap('n', 'K', ':lua ShowDocumentation()<CR>', { silent = true, noremap = true })

function ShowDocumentation()
  local filetype = vim.bo.filetype
  if filetype == 'vim' or filetype == 'help' then
    vim.cmd('h ' .. vim.fn.expand('<cword>'))
  else
    vim.fn.CocActionAsync('doHover')
  end
end

-- 高亮光标下的符号
vim.cmd('autocmd CursorHold * silent call CocActionAsync("highlight")')

-- 重新映射键用于重命名和重构
vim.api.nvim_set_keymap('n', '<leader>gv', '<Plug>(coc-rename)', { silent = true })
vim.api.nvim_set_keymap('n', '<leader>gR', '<Plug>(coc-refactor)', { silent = true })

-- 重新映射键用于格式化选中区域
vim.api.nvim_set_keymap('x', '<leader>gf', '<Plug>(coc-format-selected)', { silent = true })
vim.api.nvim_set_keymap('n', '<leader>gf', '<Plug>(coc-format-selected)', { silent = true })

-- 设置 formatexpr
vim.cmd([[
augroup mygroup
  autocmd!
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end
]])

-- 重新映射键用于执行代码操作
vim.api.nvim_set_keymap('x', '<leader>ga', '<Plug>(coc-codeaction-selected)', { silent = true })
vim.api.nvim_set_keymap('n', '<leader>ga', '<Plug>(coc-codeaction-selected)', { silent = true })
vim.api.nvim_set_keymap('n', '<leader>gC', '<Plug>(coc-codeaction)', { silent = true })
vim.api.nvim_set_keymap('n', '<leader>gF', '<Plug>(coc-fix-current)', { silent = true })

-- 创建函数文本对象的映射
vim.api.nvim_set_keymap('x', 'if', '<Plug>(coc-funcobj-i)', { silent = true })
vim.api.nvim_set_keymap('x', 'af', '<Plug>(coc-funcobj-a)', { silent = true })
vim.api.nvim_set_keymap('o', 'if', '<Plug>(coc-funcobj-i)', { silent = true })
vim.api.nvim_set_keymap('o', 'af', '<Plug>(coc-funcobj-a)', { silent = true })
vim.api.nvim_set_keymap('x', 'ic', '<Plug>(coc-classobj-i)', { silent = true })
vim.api.nvim_set_keymap('o', 'ic', '<Plug>(coc-classobj-i)', { silent = true })
vim.api.nvim_set_keymap('x', 'ac', '<Plug>(coc-classobj-a)', { silent = true })
vim.api.nvim_set_keymap('o', 'ac', '<Plug>(coc-classobj-a)', { silent = true })

-- 重新映射 <C-f> 和 <C-b> 用于滚动浮动窗口/弹出窗口
if vim.fn.has('nvim-0.4.0') == 1 or vim.fn.has('patch-8.2.0750') == 1 then
  vim.api.nvim_set_keymap('n', '<C-f>', 'coc#float#has_scroll() ? coc#float#scroll(1) : "<C-f>"', { silent = true, nowait = true, expr = true })
  vim.api.nvim_set_keymap('n', '<C-b>', 'coc#float#has_scroll() ? coc#float#scroll(0) : "<C-b>"', { silent = true, nowait = true, expr = true })
  vim.api.nvim_set_keymap('i', '<C-f>', 'coc#float#has_scroll() ? "<c-r>=coc#float#scroll(1)<cr>" : "<Right>"', { silent = true, nowait = true, expr = true })
  vim.api.nvim_set_keymap('i', '<C-b>', 'coc#float#has_scroll() ? "<c-r>=coc#float#scroll(0)<cr>" : "<Left>"', { silent = true, nowait = true, expr = true })
  vim.api.nvim_set_keymap('v', '<C-f>', 'coc#float#has_scroll() ? coc#float#scroll(1) : "<C-f>"', { silent = true, nowait = true, expr = true })
  vim.api.nvim_set_keymap('v', '<C-b>', 'coc#float#has_scroll() ? coc#float#scroll(0) : "<C-b>"', { silent = true, nowait = true, expr = true })
end

-- 使用 CTRL-S 选择范围
vim.api.nvim_set_keymap('n', '<C-s>', '<Plug>(coc-range-select)', { silent = true })
vim.api.nvim_set_keymap('x', '<C-s>', '<Plug>(coc-range-select)', { silent = true })

-- 创建命令
vim.cmd('command! -nargs=0 Format :call CocAction("format")')
vim.cmd('command! -nargs=? Fold :call CocAction("fold", <f-args>)')
vim.cmd('command! -nargs=0 OR :call CocAction("runCommand", "editor.action.organizeImport")')
vim.cmd('command! -nargs=0 Prettier :CocCommand prettier.forceFormatDocument')

-- 设置状态栏
vim.opt.statusline = '%{coc#status()}%{get(b:,"coc_current_function","")}'

-- 设置 Python 路径
-- local current_python3_path = os.getenv("CONDA_PREFIX") .. '/usr/bin/python3'
-- vim.fn['coc#config']('python3', { pythonPath = current_python3_path })

-- 设置全局扩展
vim.g.coc_global_extensions = {
--    'coc-syntax',
--    'coc-snippets',
--    'coc-highlight',
--    'coc-pairs',
--    'coc-emmet',
--    'coc-yank',
--    'coc-prettier',

    'coc-html',
    'coc-css',
    'coc-json',
    'coc-clangd',
    'coc-java',
    'coc-sh',
    'coc-pyright',
    'coc-lua',
    'coc-markdownlint',
    'coc-cmake',
    'coc-git',
--    'coc-tsserver',
--    'coc-yaml',
--    'coc-gn',
--    'coc-vetur',
}
