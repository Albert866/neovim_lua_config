-- Define common options
local opts = {
	noremap = true, -- non-recursive
	silent = true, -- do not show message
}

-----------------
-- Normal mode --
-----------------

-- default leader key: \
vim.g.mapleader = " "

-- Hint: see `:h vim.map.set()`
-- Better window navigation
vim.keymap.set("n", "<C-h>", "<C-w>h", opts)
vim.keymap.set("n", "<C-j>", "<C-w>j", opts)
vim.keymap.set("n", "<C-k>", "<C-w>k", opts)
vim.keymap.set("n", "<C-l>", "<C-w>l", opts)

vim.keymap.set("n", "<leader>wj", ":split<CR> <C-W>j", opts)
vim.keymap.set("n", "<leader>wl", ":vsplit<CR> <C-W>l", opts)
vim.keymap.set("n", "<leader>wk", "<C-W>_", opts)
vim.keymap.set("n", "<leader>wh", "<C-W>|", opts)
vim.keymap.set("n", "<leader>wc", "<C-W>c", opts)  -- c : close window
vim.keymap.set("n", "<leader>wm", "<C-W>_ <C-W>|", opts)  -- m : max window
vim.keymap.set("n", "<leader>wr", "<C-W>=", opts)   -- r : reset window

-- Resize with arrows
-- delta: 2 lines
vim.keymap.set("n", "<C-Up>", ":resize 2<CR>", opts)
vim.keymap.set("n", "<C-Down>", ":resize +2<CR>", opts)
vim.keymap.set("n", "<C-Left>", ":vertical resize -2<CR>", opts)
vim.keymap.set("n", "<C-Right>", ":vertical resize +2<CR>", opts)

-- switch between last two buffers
vim.keymap.set("n", "<leader><Tab>", "<C-^>", opts)
-- switch next/previous buffer
vim.keymap.set("n", "<leader>n", ":bn<CR>", opts)
vim.keymap.set("n", "<leader>p", ":bp<CR>", opts)
-- close current buffer
vim.keymap.set('n', '<leader>q', ':bp<CR>:bd #<CR>', opts)

-----------------
-- Visual mode --
-----------------

-- Hint: start visual mode with the same area as the previous area and the same mode
vim.keymap.set("v", "<", "<gv", opts)
vim.keymap.set("v", ">", ">gv", opts)

-- For nvim-treesitter
-- 1. Press `gss` to intialize selection. (ss = start selection)
-- 2. Now we are in the visual mode.
-- 3. Press `gsi` to increment selection by AST node. (si = selection incremental)
-- 4. Press `gsc` to increment selection by scope. (sc = scope)
-- 5. Press `gsd` to decrement selection. (sd = selection decrement)
