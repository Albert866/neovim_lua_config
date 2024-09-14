local mason_status, mason = pcall(require, "mason")
if not mason_status then
    vim.notify("Not find mason")
    return
end

local nlsp_status, nvim_lsp = pcall(require, "lspconfig")
if not nlsp_status then
    vim.notify("Not find lspconfig")
    return
end

local mlsp_status, mason_lspconfig = pcall(require, "mason-lspconfig")
if not mlsp_status then
    vim.notify("Not find mason-lspconfig")
    return
end

-- Loading mason.nvim plugin
require('mason').setup()

-- Loading mason-lspconfig.nvim plugin
require('mason-lspconfig').setup({
    ensure_installed = { 'ccls', 'bashls', 'lua_ls', 'pyright' },
    automatic_installation = true,
})

-- Loading nvim-lspconfig plugin
local lspconfig = require('lspconfig')

-- Configure LSP clients
local on_attach = function(client, bufnr)
    -- Define LSP keymaps
    local opts = { noremap = true, silent = true, buffer = bufnr }
    vim.keymap.set('n', 'gh', vim.lsp.buf.hover, opts)
    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
    vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
    vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
    vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
    vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, opts)
    vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, opts)
    vim.keymap.set('n', '<leader>=', vim.lsp.buf.formatting, opts)
end

-- Configure LSP servers
local servers = { 'ccls', 'bashls', 'lua_ls', 'pyright' }
for _, lsp in ipairs(servers) do
    lspconfig[lsp].setup {
        on_attach = on_attach,
        flags = {
            debounce_text_changes = 150,
        }
    }
end
