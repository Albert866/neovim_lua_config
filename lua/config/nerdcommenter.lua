-- config for nerdcommenter

-- 添加注释分隔符后默认添加空格
vim.g.NERDSpaceDelims = 1

-- 针对 python3 文件类型的特殊处理
vim.api.nvim_create_autocmd('FileType', {
    pattern = 'python3',
    callback = function()
        vim.g.NERDSpaceDelims = 0
    end,
})

-- 使用紧凑的多行注释格式
vim.g.NERDCompactSexyComs = 1

-- 左对齐注释分隔符
vim.g.NERDDefaultAlign = 'left'

-- 使用 Java 的备用分隔符
vim.g.NERDAltDelims_java = 1

-- 允许注释和反注释空行
vim.g.NERDCommentEmptyLines = 1

-- 取消注释时修剪尾随空格
vim.g.NERDTrimTrailingWhitespace = 1

-- 启用 NERDCommenterToggle 检查所有选定行是否已注释
vim.g.NERDToggleCheckAllLines = 1

-- 设置快捷键
vim.api.nvim_set_keymap('n', '<leader>c<space>', ':NERDCommenterToggle<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>cs', ':NERDCommenterSexy<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>cc', ':NERDCommenterComment<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>cn', ':NERDCommenterNested<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>cA', ':NERDCommenterAppend<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>c$', ':NERDCommenterToEOL<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>cu', ':NERDCommenterUncomment<CR>', { noremap = true, silent = true })
