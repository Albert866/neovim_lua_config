-- nvim-ts-rainbow.lua is a plugin that highlights parentheses, brackets, and braces according

require 'nvim-treesitter.configs'.setup {
    -- Enable rainbow parentheses
    rainbow = {
        enable = true,         -- Enable 彩虹括号
        extended_mode = true,  -- Also highlight non-bracket delimiters like HTML tags
        max_file_lines = 5000, -- Do not limit the number of lines in a file
    }
}
