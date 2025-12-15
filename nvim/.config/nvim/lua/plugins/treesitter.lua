return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	lazy = false,
	main = "nvim-treesitter.configs",

	opts = {
		highlight = {
			enable = true,
		},

		indent = {
			enable = true,
		},

		-- OPTIONAL but very useful (Vim-style)
		incremental_selection = {
			enable = true,
			keymaps = {
				init_selection = "gnn",
				node_incremental = "grn",
				node_decremental = "grm",
			},
		},
	},

	config = function()
		-- Tree-sitter powered folding (Vim-native keys)
		vim.opt.foldmethod = "expr"
		vim.opt.foldexpr = "v:lua.vim.treesitter.foldexpr()"
		vim.opt.foldlevel = 99
	end,
}
