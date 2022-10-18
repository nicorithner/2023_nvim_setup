require("mason-lspconfig").setup({
	ensure_installed = { "sumneko_lua", "rust_analyzer", "tsserver", "solargraph", "cssls", "emmet_ls" },
	automatic_installation = true,
})
