-- define your colorscheme here
-- Monokai (monokai) Monokai Pro (monokai_pro) Monokai Soda (monokai_soda) Monokai Ristretto (monokai_ristretto)
local colorscheme = 'monokai_soda'

-- Fallback to other colorschemes
local is_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
if not is_ok then
    vim.notify('colorscheme ' .. colorscheme .. ' not found!')
    return
end
