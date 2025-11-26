local sw = require("config.switch")

return {
	"lewis6991/gitsigns.nvim",
	enabled = sw.gitsingns,
	opts = {
		signs = {
			add = { text = "+" },
			change = { text = "~" },
			delete = { text = "_" },
			topdelete = { text = "‾" },
			changedelete = { text = "~" },
		},
	},
}
