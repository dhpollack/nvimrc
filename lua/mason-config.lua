
require('mason').setup()
require('mason-lspconfig').setup()
require("mason-lspconfig").setup {
    ensure_installed = { "gopls", "rust_analyzer", "ruff_lsp" },
}
require('lspconfig').gopls.setup {}
require('lspconfig').rust_analyzer.setup {}
