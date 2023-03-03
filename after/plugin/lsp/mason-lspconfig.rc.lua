require("mason-lspconfig").setup({
	ensure_installed = {
		lua_ls = {
			Lua = {
				workspace = { checkThirdParty = false },
				telemetry = { enable = false },
			},
		},
	},
	automatic_installation = true,
})
