-- config/nerdtree.lua
-- press 'm' select tree options into NERDTree

-- configure ryanoasis/vim-devicons
vim.g.webdevicons_enable = true
vim.g.webdevicons_enable_nerdtree = true
vim.g.webdevicons_enable_unite = true
vim.g.webdevicons_enable_vimfiler = true
vim.g.webdevicons_enable_ctrlp = true
vim.g.WebDevIconsUnicodeDecorateFileNodes = true
vim.g.WebDevIconsUnicodeDecorateFolderNodes = true

-- configure nerdtree-git-plugin, if not set is use default icons
vim.g.NERDTreeIndicatorMapCustom = {
  Modified  = "✹",
  Staged    = "✚",
  Untracked = "✭",
  Renamed   = "➜",
  Unmerged  = "═",
  Deleted   = "✖",
  Dirty     = "✗",
  Clean     = "✔︎",
  Ignored   = "☒"
}

-- set NERDTree viwer size
vim.g.NERDTreeWinSize = 28

-- start NERDTree automatically
vim.g.NERDTreeShowBookmarks = true

-- Automatically open NERDTree if no files are opened when starting Vim
vim.api.nvim_create_autocmd('VimEnter', {
    pattern = '*',
    callback = function()
        if vim.fn.argc() == 0 then
            vim.cmd('NERDTree')
        end
    end,
})

-- Automatically close NERDTree if it is the only remaining window
vim.api.nvim_create_autocmd('BufEnter', {
    pattern = '*',
    callback = function()
        if vim.fn.winnr('$') == 1 and vim.b.NERDTree and type(vim.b.NERDTree.isTabTree) == 'function' and vim.b.NERDTree.isTabTree() then
            vim.cmd('q')
        end
    end,
})

-- Automatically switch to the previous buffer
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

-- Set the icons for the tree display, display nil because use vim-devicons
vim.g.NERDTreeDirArrowExpandable = ''
vim.g.NERDTreeDirArrowCollapsible = ''

-- Filter out all .o files from being displayed
vim.g.NERDTreeIgnore = { '\\.o$' }

-- Whether to show line numbers
vim.g.NERDTreeShowLineNumbers = false

-- Do not show hidden files
vim.g.NERDTreeHidden = true

-- Beautify NERDTree
vim.g.NERDTreeMinimalUI = true
vim.g.NERDTreeDirArrows = true

-- Set key mappings
vim.api.nvim_set_keymap('n', '<leader>tt', ':NERDTreeToggle<CR>', { noremap = true, silent = true }) -- Toggle NERDTree
vim.api.nvim_set_keymap('n', '<leader>tf', ':NERDTreeFocus<CR>', { noremap = true, silent = true }) -- Focus NERDTree
vim.api.nvim_set_keymap('n', '<leader>te', ':NERDTree<CR>', { noremap = true, silent = true }) -- Open NERDTree
vim.api.nvim_set_keymap('n', '<leader>tg', ':NERDTreeFind<CR>', { noremap = true, silent = true }) -- Find current file in NERDTree
vim.api.nvim_set_keymap('n', '<leader>th', ':NERDTreeHidden<CR>', { noremap = true, silent = true }) -- Toggle hidden files in NERDTree

