-- define your colorscheme here
-- 'monokai_pro' or 'monokai_soda' or 'monokai_ristretto'
local colorscheme = 'monokai_soda'

-- Fallback to other colorschemes
local is_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
if not is_ok then
    vim.notify('colorscheme ' .. colorscheme .. ' not found!')
    return
end
