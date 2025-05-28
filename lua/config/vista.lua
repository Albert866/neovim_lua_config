-- liuchengxu/vista.vim cofniguration

-- 设置默认使用 ctags
if vim.fn.filereadable('tags') == 1 then
    vim.g.vista_default_executive = 'ctags'
else
    vim.g.vista_default_executive = 'coc'
end
-- Vista 侧边栏宽度
vim.g.vista_sidebar_width = 32
-- 光标悬停时显示当前符号
vim.g.vista_echo_cursor = 1
-- 可选：只显示函数和类
-- vim.g.vista_filter_kind = { 'function', 'class' }

-- 快捷键：<leader>v 打开/关闭 Vista
vim.keymap.set('n', '<leader>v', ':Vista!!<CR>', { noremap = true, silent = true })
