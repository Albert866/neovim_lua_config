return {
  {
    "iamcco/markdown-preview.nvim",
    init = function()
      -- markdown-preview.nvim 要求使用绝对路径
      vim.g.mkdp_markdown_css = vim.fn.expand("~/.config/nvim/markdown-preview-wide.css")
    end,
  },
}
