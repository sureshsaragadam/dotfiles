return {
	"nvim-treesitter/nvim-treesitter",

	enabled = true,
	lazy = false,

	build = ":TSUpdate",

	event = { "BufReadPost", "BufNewFile" },

	config = function()
		require("nvim-treesitter.config").setup({
			ensure_installed = {
				"bash",
				"c",
				"cpp",
				"javascript",
				"python",
				"diff",
				"html",
				"css",
				"lua",
				"luadoc",
				"markdown",
				"markdown_inline",
				"query",
				"vim",
				"vimdoc",
			},

			auto_install = true,

			highlight = {
				enable = true,
				additional_vim_regex_highlighting = { "ruby" },
			},

			indent = {
				enable = true,
				disable = { "ruby" },
			},
		})
	end,
}
