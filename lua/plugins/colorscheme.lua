-- Colorscheme configuration for LazyVim
if true then
  return {}
end

-- monokai.nvim is a popular colorscheme for Neovim
return {
  {
    "tanvirtin/monokai.nvim",
  },

  -- Configure LazyVim to load monokai
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "monokai_soda",
    },
  },
}
