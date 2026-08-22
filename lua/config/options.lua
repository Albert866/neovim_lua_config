-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
local opt = vim.opt

-- opt.tabstop = 2 -- Number of spaces tabs count for
-- opt.shiftwidth = 4 -- Size of an indent
opt.fileformats = { "unix" }
-- opt.encoding = "utf-8"
-- opt.fileencodings = { "utf-8" }

vim.g.lazyvim_check_order = false -- Disable the check for order of plugins
