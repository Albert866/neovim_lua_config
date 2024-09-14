
require'nvim-treesitter.configs'.setup {
    -- Enable rainbow parentheses
    rainbow = {
        enable = true,
        extended_mode = true, -- Also highlight non-bracket delimiters like HTML tags
        max_file_lines = nil, -- Do not limit the number of lines in a file
        colors = {
            "#FF0000", -- Red
            "#FF7F00", -- Orange
            "#FFFF00", -- Yellow
            "#00FF00", -- Green
            "#0000FF", -- Blue
            "#4B0082", -- Indigo
            "#9400D3", -- Violet
        },
        termcolors = {
            "Red",
            "Yellow",
            "Green",
            "Blue",
            "Magenta",
            "Cyan",
            "White",
        }
    }
}
