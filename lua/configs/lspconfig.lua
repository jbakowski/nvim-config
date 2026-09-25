require("nvchad.configs.lspconfig").defaults()

local servers = { "html", "cssls", "clangd", "pyright" }
vim.lsp.enable(servers)

-- diagnostics display configuration
vim.diagnostic.config({
  ---
})

-- references list: grr (built into Neovim) · diagnostics list: <leader>ds (NvChad)
-- read :h vim.lsp.config for changing options of lsp servers
