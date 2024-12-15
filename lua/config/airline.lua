-- config/vim-airline

-- congfigure vim-airline-themes
vim.g.airline_powerline_fonts = 1
vim.g.airline_theme = "desertink"

-- Custom function to get file type symbol
function WebDevIconsGetFileTypeSymbol()
  local filename = vim.fn.expand('%:t')
  local extension = vim.fn.expand('%:e')
  local icon = require'nvim-web-devicons'.get_icon(filename, extension, {default = true})
  return icon
end

-- Configure airline to use the custom function
vim.g.airline_section_b = '%{v:lua.WebDevIconsGetFileTypeSymbol()} %f'

-- enable tabline extern
vim.g['webdevicons_enable_airline_tabline'] = 1
vim.g['webdevicons_enable_airline_bufferline'] = 1
vim.g['airline#extensions#tabline#enabled'] = 1
vim.g['airline#extensions#tabline#left_alt_sep'] = '|'
vim.g['airline#extensions#tabline#buffer_nr_show'] = 0
vim.g['airline#extensions#tabline#formatter'] = 'unique_tail'  -- unique_tail is only display filename, default is display all

-- enable keymap extern
vim.g['airline#extensions#keymap#enabled'] = 1

-- set tabline buffer idex_mode and format
vim.g['airline#extensions#tabline#buffer_idx_mode'] = 1
vim.g['airline#extensions#tabline#buffer_idx_format'] = {
    ['0'] = '0 ',
    ['1'] = '1 ',
    ['2'] = '2 ',
    ['3'] = '3 ',
    ['4'] = '4 ',
    ['5'] = '5 ',
    ['6'] = '6 ',
    ['7'] = '7 ',
    ['8'] = '8 ',
    ['9'] = '9 '
}

-- Set swith tab key mappings, swith num.1~10 tab
for i = 1, 9 do
  vim.api.nvim_set_keymap('n', '<Leader>' .. i, '<Plug>AirlineSelectTab' .. i, {})
end
vim.api.nvim_set_keymap('n', '<leader>0', '<Plug>AirlineSelectTab0', {})

vim.api.nvim_set_keymap('n', '<leader>-', '<Plug>AirlineSelectPrevTab', {})
vim.api.nvim_set_keymap('n', '<leader>=', '<Plug>AirlineSelectNextTab', {})
vim.api.nvim_set_keymap('n', '<leader>q', ':bp<CR>:bd #<CR>', { noremap = true, silent = true })

if vim.g.airline_symbols == nil then
    vim.g.airline_symbols = {}
end

vim.g.airline_symbols.linenr = 'CL' -- current line
vim.g.airline_symbols.whitespace = '|'
vim.g.airline_symbols.maxlinenr = 'Ml' -- max line
vim.g.airline_symbols.branch = 'BR'
vim.g.airline_symbols.readonly = 'RO'
vim.g.airline_symbols.dirty = 'DT'
vim.g.airline_symbols.crypt = 'CR'
