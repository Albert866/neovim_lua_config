-- config/nerdtree.lua

-- 设置 NERDTree 视窗大小
vim.g.NERDTreeWinSize = 28

-- 开启 NERDTree 时自动显示书签
vim.g.NERDTreeShowBookmarks = 1

-- 打开 Vim 时如果没有文件自动打开 NERDTree
vim.api.nvim_create_autocmd('VimEnter', {
    pattern = '*',
    callback = function()
        if vim.fn.argc() == 0 then
            vim.cmd('NERDTree')
        end
    end,
})

-- 当 NERDTree 为剩下的唯一窗口时自动关闭
vim.api.nvim_create_autocmd('BufEnter', {
    pattern = '*',
    callback = function()
        if vim.fn.winnr('$') == 1 and vim.b.NERDTree and type(vim.b.NERDTree.isTabTree) == 'function' and vim.b.NERDTree.isTabTree() then
            vim.cmd('q')
        end
    end,
})

-- 自动切换到上一个缓冲区
vim.api.nvim_create_autocmd('BufEnter', {
    pattern = '*',
    callback = function()
        if vim.fn.bufname('#') ~= '' and vim.fn.bufname('#'):match('NERD_tree_%d+') and not vim.fn.bufname('%'):match('NERD_tree_%d+') and vim.fn.winnr('$') > 1 then
            local buf = vim.fn.bufnr()
            vim.cmd('buffer#')
            vim.cmd('normal! <C-W>w')
            vim.cmd('buffer' .. buf)
        end
    end,
})

-- 设置树的显示图标
vim.g.NERDTreeDirArrowExpandable = '+'
vim.g.NERDTreeDirArrowCollapsible = '-'

-- 过滤所有 .o 文件不显示
vim.g.NERDTreeIgnore = { '\\.o$' }

-- 是否显示行号
vim.g.NERDTreeShowLineNumbers = 0

-- 不显示隐藏文件
vim.g.NERDTreeHidden = 1

-- 美化 NERDTree
vim.g.NERDTreeMinimalUI = 1
vim.g.NERDTreeDirArrows = 1

-- 设置快捷键
vim.api.nvim_set_keymap('n', '<leader>mt', ':NERDTreeToggle<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>ms', ':NERDTreeFocus<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>me', ':NERDTree<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>mf', ':NERDTreeFind<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>m.', ':NERDTreeHidden<CR>', { noremap = true, silent = true })
