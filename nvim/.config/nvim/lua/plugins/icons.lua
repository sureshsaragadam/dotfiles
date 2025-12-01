return {
	{
		"nvim-tree/nvim-web-devicons",
		lazy = true,
		config = function()
			local ok = vim.g.have_nerd_font or false
			require("nvim-web-devicons").setup({
				default = ok,
			})
		end,
	},
}
