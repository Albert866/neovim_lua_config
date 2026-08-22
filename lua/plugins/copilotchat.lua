return {
  "CopilotChat.nvim",
  opts = {
    temperature = 0.1,
    window = {
      layout = "vertical",
      width = 0.4,
    },
    auto_insert_mode = true,
    servers = {
      -- copilot.lua only works with its own copilot lsp server
      copilot = { enabled = true },
    },
  },
}
