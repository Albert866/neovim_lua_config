return {
  "CopilotChat.nvim",
  opts = {
    model = "gpt-4.1",
    -- model = "gpt-5-mini",
    -- model = "gpt-5.1",
    -- model = "gpt-5.1-codex-max",
    -- model = "gpt-5.3-codex",
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
