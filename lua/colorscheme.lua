-- define your colorscheme here
-- monokai/gruvbox/onedark/nightfox/tokyonight
local colorscheme = 'monokai'

-- Fallback to other colorschemes
local is_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
if not is_ok then
    vim.notify('colorscheme ' .. colorscheme .. ' not found!')
    return
end

-- Ensure true color support
vim.opt.termguicolors = true

-- Define the Monokai palette (from monokai.nvim)
local palettes = {
    classic = {
        name = 'monokai',
        base0 = '#222426',
        base1 = '#272a30',
        base2 = '#26292C',
        base3 = '#2E323C',
        base4 = '#333842',
        base5 = '#4d5154',
        base6 = '#9ca0a4',
        base7 = '#b1b1b1',
        base8 = '#e3e3e1',
        border = '#a1b5b1',
        brown = '#504945',
        white = '#f8f8f0',
        grey = '#8F908A',
        black = '#000000',
        pink = '#f92672',
        green = '#a6e22e',
        aqua = '#66d9ef',
        yellow = '#e6db74',
        orange = '#fd971f',
        purple = '#ae81ff',
        red = '#e95678',
        diff_add = '#3d5213',
        diff_remove = '#4a0f23',
        diff_change = '#27406b',
        diff_text = '#23324d',
    },
    pro = {
        name = 'monokai_pro',
        base0 = '#222426',
        base1 = '#211F22',
        base2 = '#26292C',
        base3 = '#2E323C',
        base4 = '#333842',
        base5 = '#4d5154',
        base6 = '#72696A',
        base7 = '#B1B1B1',
        base8 = '#e3e3e1',
        border = '#A1B5B1',
        brown = '#504945',
        white = '#FFF1F3',
        grey = '#72696A',
        black = '#000000',
        pink = '#FF6188',
        green = '#A9DC76',
        aqua = '#78DCE8',
        yellow = '#FFD866',
        orange = '#FC9867',
        purple = '#AB9DF2',
        red = '#FD6883',
        diff_add = '#3d5213',
        diff_remove = '#4a0f23',
        diff_change = '#27406b',
        diff_text = '#23324d',
    },
    soda = {
        name = 'monokai_soda',
        base0 = '#222426',
        base1 = '#211F22',
        base2 = '#26292C',
        base3 = '#2E323C',
        base4 = '#333842',
        base5 = '#4d5154',
        base6 = '#72696A',
        base7 = '#B1B1B1',
        base8 = '#e3e3e1',
        border = '#A1B5B1',
        brown = '#504945',
        white = '#f6f6ec',
        grey = '#72696A',
        black = '#000000',
        pink = '#f3005f',
        green = '#97e023',
        aqua = '#78DCE8',
        yellow = '#dfd561',
        orange = '#fa8419',
        purple = '#9c64fe',
        red = '#f3005f',
        diff_add = '#3d5213',
        diff_remove = '#4a0f23',
        diff_change = '#27406b',
        diff_text = '#23324d',
    },
    ristretto = {
        name = 'monokai_ristretto',
        base0 = '#191515',
        base1 = '#211c1c',
        base2 = '#2c2525',
        base3 = '#403838',
        base4 = '#5b5353',
        base5 = '#72696a',
        base6 = '#8c8384',
        base7 = '#c3b7b8',
        base8 = '#fff1f3',
        border = '#A1B5B1',
        brown = '#352e2e',
        white = '#fff1f3',
        grey = '#72696a',
        black = '#000000',
        pink = '#FF6188',
        green = '#adda78',
        aqua = '#85dacc',
        yellow = '#f9cc6c',
        orange = '#f38d70',
        purple = '#a8a9eb',
        red = '#fd6883',
        diff_add = '#527728',
        diff_remove = '#842335',
        diff_change = '#247c6e',
        diff_text = '#23324d',
    },
}

-- Choose your preferred palette
local selected_palette = palettes.classic -- Change this to 'classic', 'pro', 'soda', or 'ristretto'

-- Apply custom highlights
local function applay_palette(palette)
    -- Syntax groups
    vim.api.nvim_set_hl(0, "Normal", { fg = palette.white, bg = palette.base1 }) -- Default text
    vim.api.nvim_set_hl(0, "Comment", { fg = palette.grey, italic = true })      -- Comments
    vim.api.nvim_set_hl(0, "Keyword", { fg = palette.pink, bold = true })        -- Keywords
    vim.api.nvim_set_hl(0, "String", { fg = palette.yellow })                    -- Strings
    vim.api.nvim_set_hl(0, "Function", { fg = palette.green, bold = true })      -- Functions
    vim.api.nvim_set_hl(0, "Variable", { fg = palette.orange })                  -- Variables
    vim.api.nvim_set_hl(0, "Type", { fg = palette.aqua, bold = true })           -- Types
    vim.api.nvim_set_hl(0, "Constant", { fg = palette.purple })                  -- Constants

    -- Git signs
    vim.api.nvim_set_hl(0, "GitSignsAdd", { fg = palette.green, bg = palette.base2 })
    vim.api.nvim_set_hl(0, "GitSignsDelete", { fg = palette.pink, bg = palette.base2 })
    vim.api.nvim_set_hl(0, "GitSignsChange", { fg = palette.orange, bg = palette.base2 })

    -- Diff highlights
    vim.api.nvim_set_hl(0, "DiffAdd", { bg = palette.diff_add })
    vim.api.nvim_set_hl(0, "DiffDelete", { bg = palette.diff_remove })
    vim.api.nvim_set_hl(0, "DiffChange", { bg = palette.diff_change })
    vim.api.nvim_set_hl(0, "DiffText", { bg = palette.diff_text })

    -- UI elements
    vim.api.nvim_set_hl(0, "CursorLine", { bg = palette.base3 })                      -- Cursor line background
    vim.api.nvim_set_hl(0, "LineNr", { fg = palette.base5 })                          -- Line numbers
    vim.api.nvim_set_hl(0, "CursorLineNr", { fg = palette.white, bold = true })       -- Current line number
    vim.api.nvim_set_hl(0, "Pmenu", { fg = palette.white, bg = palette.base3 })       -- Popup menu
    vim.api.nvim_set_hl(0, "PmenuSel", { fg = palette.base1, bg = palette.green })    -- Popup menu selection
    vim.api.nvim_set_hl(0, "StatusLine", { fg = palette.white, bg = palette.base3 })  -- Status line
    vim.api.nvim_set_hl(0, "StatusLineNC", { fg = palette.grey, bg = palette.base3 }) -- Inactive status line
end

-- Apply the custom highlights
applay_palette(selected_palette)
