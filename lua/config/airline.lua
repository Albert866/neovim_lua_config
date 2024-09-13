-- config/vim-airline

-- enable tabline extern
vim.g['airline#extensions#tabline#enabled'] = 1
vim.g['airline#extensions#tabline#left_alt_sep'] = '|'
vim.g['airline#extensions#tabline#buffer_nr_show'] = 0
vim.g['airline#extensions#tabline#formatter'] = 'default'

-- set theme
vim.g.airline_theme = 'desertink'

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

-- Set swith tab key
vim.api.nvim_set_keymap('n', '<leader>0', '<Plug>AirlineSelectTab0', {})
vim.api.nvim_set_keymap('n', '<leader>1', '<Plug>AirlineSelectTab1', {})
vim.api.nvim_set_keymap('n', '<leader>2', '<Plug>AirlineSelectTab2', {})
vim.api.nvim_set_keymap('n', '<leader>3', '<Plug>AirlineSelectTab3', {})
vim.api.nvim_set_keymap('n', '<leader>4', '<Plug>AirlineSelectTab4', {})
vim.api.nvim_set_keymap('n', '<leader>5', '<Plug>AirlineSelectTab5', {})
vim.api.nvim_set_keymap('n', '<leader>6', '<Plug>AirlineSelectTab6', {})
vim.api.nvim_set_keymap('n', '<leader>7', '<Plug>AirlineSelectTab7', {})
vim.api.nvim_set_keymap('n', '<leader>8', '<Plug>AirlineSelectTab8', {})
vim.api.nvim_set_keymap('n', '<leader>9', '<Plug>AirlineSelectTab9', {})
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
