-- lua/plugins/lsp.lua-- lua/plugins/lsp.lua
local servers = require("plugins.lsp.servers")
local diagnostics = require("plugins.lsp.diagnostics")
local capabilities = require("plugins.lsp.capabilities")
local keymaps = require("plugins.lsp.keymaps")

return {
	-- MASON + TOOLING
	{
		"williamboman/mason.nvim",
		opts = {},
	},
	{ "williamboman/mason-lspconfig.nvim" },
	{ "WhoIsSethDaniel/mason-tool-installer.nvim" },
	{ "j-hui/fidget.nvim", opts = {} },
	{ "saghen/blink.cmp" },

	-- MAIN LSP CONFIG
	{
		"neovim/nvim-lspconfig",
		dependencies = {
			"williamboman/mason.nvim",
			"williamboman/mason-lspconfig.nvim",
			"saghen/blink.cmp",
		},

		config = function()
			-- diagnostics
			vim.diagnostic.config(diagnostics)

			-- keymaps on attach
			vim.api.nvim_create_autocmd("LspAttach", {
				group = vim.api.nvim_create_augroup("plugins-lsp-attach", { clear = true }),
				callback = keymaps.on_attach,
			})

			-- auto install LSPs
			local ensure = vim.tbl_keys(servers)
			vim.list_extend(ensure, { "stylua" })
			require("mason-tool-installer").setup({ ensure_installed = ensure })

			-- setup LSPs
			require("mason-lspconfig").setup({
				handlers = {
					function(server)
						local opts = servers[server] or {}
						opts.capabilities = vim.tbl_deep_extend("force", {}, capabilities, opts.capabilities or {})
						require("lspconfig")[server].setup(opts)
					end,
				},
			})
		end,
	},
}
