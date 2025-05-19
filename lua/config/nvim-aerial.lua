-- config/aerial.lua

require('aerial').setup({
    -- Cofniguration options
    backends = { "lsp", "coc", "treesitter", "markdown" },
    layout = {
        min_width = 30,
        default_direction = "right",
    },
    show_guides = true,
    guides = {
        mid_item = "├─ ",
        last_item = "└─ ",
        nested_top = "│  ",
        whitespace = "   ",
    },

    filter_kind = false, -- display all symbols

    -- Clost the Aerial window when leaving the buffer
    on_enter = function(_)
        -- close the aerial window
        require("aerial").close()
    end,
})

-- Set up keybindings
vim.api.nvim_set_keymap('n', '<leader>t', ':AerialToggle!<CR>:wincmd p<CR>', { noremap = true, silent = true })
