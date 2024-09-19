
-- Create default mappings
vim.g.NERDCreateDefaultMappings = 1

-- Add spaces after comment delimiters by default
vim.g.NERDSpaceDelims = 1

-- Use compact syntax for prettified multi-line comments
vim.g.NERDCompactSexyComs = 1

-- Align line-wise comment delimiters flush left instead of following code indentation
vim.g.NERDDefaultAlign = 'left'

-- Set a language to use its alternate delimiters by default
vim.g.NERDAltDelims_java = 1

-- Add your own custom formats or override the defaults
vim.g.NERDCustomDelimiters = { c = { left = '/**', right = '*/' } }

-- Allow commenting and inverting empty lines (useful when commenting a region)
vim.g.NERDCommentEmptyLines = 1

-- Enable trimming of trailing whitespace when uncommenting
vim.g.NERDTrimTrailingWhitespace = 1

-- Enable NERDCommenterToggle to check all selected lines is commented or not 
vim.g.NERDToggleCheckAllLines = 1

-- Define a function to simplify key mappings
local function map(mode, lhs, rhs, opts)
  local options = { noremap = true, silent = true }
  if opts then
    options = vim.tbl_extend('force', options, opts)
  end
  vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

-- Create key mappings for nerdcommenter
map('n', '<leader>cc', '<Plug>NERDCommenterComment')
map('v', '<leader>cc', '<Plug>NERDCommenterComment')

map('n', '<leader>cn', '<Plug>NERDCommenterNested')
map('v', '<leader>cn', '<Plug>NERDCommenterNested')

map('n', '<leader>c<space>', '<Plug>NERDCommenterToggle')
map('v', '<leader>c<space>', '<Plug>NERDCommenterToggle')

map('n', '<leader>cm', '<Plug>NERDCommenterMinimal')
map('v', '<leader>cm', '<Plug>NERDCommenterMinimal')

map('n', '<leader>ci', '<Plug>NERDCommenterInvert')
map('v', '<leader>ci', '<Plug>NERDCommenterInvert')

map('n', '<leader>cs', '<Plug>NERDCommenterSexy')
map('v', '<leader>cs', '<Plug>NERDCommenterSexy')

map('n', '<leader>cy', '<Plug>NERDCommenterYank')
map('v', '<leader>cy', '<Plug>NERDCommenterYank')

map('n', '<leader>c$', '<Plug>NERDCommenterToEOL')
map('v', '<leader>c$', '<Plug>NERDCommenterToEOL')

map('n', '<leader>cA', '<Plug>NERDCommenterAppend')
map('v', '<leader>cA', '<Plug>NERDCommenterAppend')

map('n', '<leader>ca', '<Plug>NERDCommenterAltDelims')
map('v', '<leader>ca', '<Plug>NERDCommenterAltDelims')

map('n', '<leader>cl', '<Plug>NERDCommenterAlignLeft')
map('v', '<leader>cl', '<Plug>NERDCommenterAlignLeft')

map('n', '<leader>cb', '<Plug>NERDCommenterAlignBoth')
map('v', '<leader>cb', '<Plug>NERDCommenterAlignBoth')

map('n', '<leader>cu', '<Plug>NERDCommenterUncomment')
map('v', '<leader>cu', '<Plug>NERDCommenterUncomment')
