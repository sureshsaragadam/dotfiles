local sw = require("config.switch")

return {
	{ -- Add indentation guides even on blank lines
		"lukas-reineke/indent-blankline.nvim",
		enabled = sw.indent_line,

		-- Enable `lukas-reineke/indent-blankline.nvim`
		-- See `:help ibl`
		main = "ibl",
		opts = {},
	},
}
