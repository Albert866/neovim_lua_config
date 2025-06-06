-- Colorscheme configuration for LazyVim
if true then
  return {}
end

return {
  -- monokai
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
