-- Set keymap
vim.api.nvim_set_keymap('n', '<F3>', ':MarkdownPreview<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<F4>', ':MarkdownPreviewToggle<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<F5>', ':MarkdownStop<CR>', { noremap = true, silent = true })

vim.g.mkdp_filetypes = { "markdown" }
vim.g.mkdp_auto_start = 0
vim.g.mkdp_auto_close = 1
vim.g.mkdp_refresh_slow = 1
vim.g.mkdp_open_to_the_world = 0
vim.g.mkdp_browser = ''
vim.g.mkdp_port = ''
vim.g.mkdp_page_title = ' **${name}** '
