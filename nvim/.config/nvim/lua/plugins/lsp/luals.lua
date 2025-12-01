return {
	settings = {
		Lua = {
			runtime = { version = "LuaJIT" },
			workspace = {
				checkThirdParty = false,
				library = vim.api.nvim_get_runtime_file("", true), -- <== FIX
			},
			diagnostics = {
				globals = { "vim" }, -- <== FIX
			},
			completion = {
				callSnippet = "Replace",
			},
			hint = { enable = true },
		},
	},
}
