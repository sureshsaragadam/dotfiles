return {
	clangd = {},
	pyright = {},
	ts_ls = {},
	html = {},
	cssls = {},
	jsonls = {},

	-- Markdown LSP
	-- marksman = {},

	lua_ls = {
		settings = {
			Lua = {
				diagnostics = {
					globals = { "vim" },
				},
				completion = { callSnippet = "Replace" },
				hint = { enable = true },
				runtime = { version = "LuaJIT" },
				workspace = {
					checkThirdParty = false,
					library = {
						vim.env.VIMRUNTIME,
						vim.fn.stdpath("config"),
						"${3rd}/lazy.nvim/types",
						"${3rd}/luv/library",
					},
				},
			},
		},
	},
}
