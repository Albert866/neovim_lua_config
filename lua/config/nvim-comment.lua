-- nvim-comment plugin configuration

-- config nvim-comment plugin
require('nvim_comment').setup({
    -- cofniguration options
    marker_padding = true, -- Add a space between the comment marker and the text
    comment_empty = false, -- Do not comment empty lines
    create_mappings = true, -- Create default key mappings
})

-- Set key mappings
vim.api.nvim_set_keymap('n', '<leader>c<space>', ':CommentToggle<CR>', { noremap = true, silent = true }) -- Toggle comment
vim.api.nvim_set_keymap('v', '<leader>c<space>', ':CommentToggle<CR>', { noremap = true, silent = true }) -- Toggle comment in visual mode
