-- LeaderF cofniguration
vim.g.Lf_HideHelp = 1
vim.g.Lf_UseCache = 0
vim.g.Lf_UseVersionControlTool = 0
vim.g.Lf_IgnoreCurrentBufferName = 1
vim.g.Lf_WindowPosition = 'popup'
vim.g.Lf_PreviewInPopup = 1
vim.g.Lf_StlSeparator = { left = [[\ue0b0]], right = [[\ue0b2]], font = "DejaVu Sans Mono for Powerline" }
vim.g.Lf_PreviewResult = { Function = 0, BufTag = 0 }

-- Set key mappings
-- open a file search
vim.api.nvim_set_keymap('n', '<leader>ff', ':LeaderfFile<CR>', { noremap = true, silent = true })
-- open a buffer search
vim.api.nvim_set_keymap('n', '<leader>fb', ':<C-U><C-R>=printf("Leaderf buffer %s", "")<CR><CR>', { noremap = true, silent = true })
-- open a bufTag search
vim.api.nvim_set_keymap('n', '<leader>fh', ':<C-U><C-R>=printf("Leaderf bufTag %s", "")<CR><CR>', { noremap = true, silent = true })
-- open a function search
vim.api.nvim_set_keymap('n', '<leader>fc', ':<C-U><C-R>=printf("Leaderf function %s", "")<CR><CR>', { noremap = true, silent = true })
-- open a line search
vim.api.nvim_set_keymap('n', '<leader>fl', ':<C-U><C-R>=printf("Leaderf line %s", "")<CR><CR>', { noremap = true, silent = true })
-- open a mru
vim.api.nvim_set_keymap('n', '<leader>fm', ':<C-U><C-R>=printf("Leaderf mru %s", "")<CR><CR>', { noremap = true, silent = true })
-- Search for the word under the cursor in the current buffer using rg.
vim.api.nvim_set_keymap('n', '<C-B>', ':<C-U><C-R>=printf("Leaderf! rg --current-buffer -e %s ", expand("<cword>"))<CR>', { noremap = true, silent = true })
-- Search for the word under the cursor in the entire project using rg.
vim.api.nvim_set_keymap('n', '<C-F>', ':<C-U><C-R>=printf("Leaderf! rg -e %s ", expand("<cword>"))<CR>', { noremap = true, silent = true })
--  (in visual mode): Search for the visually selected text in the entire project using rg.
vim.api.nvim_set_keymap('x', 'ff', ':<C-U><C-R>=printf("Leaderf! rg -F -e %s ", leaderf#Rg#visual())<CR>', { noremap = true, silent = true })
-- Recall the last rg search result.
vim.api.nvim_set_keymap('n', 'fo', ':<C-U>Leaderf! rg --recall<CR>', { noremap = true, silent = true })
