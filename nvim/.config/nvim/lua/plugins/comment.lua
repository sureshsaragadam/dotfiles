local sw = require("config.switch")

return {
	"numToStr/Comment.nvim",
	enabled = sw.comment,
	opts = {},
	lazy = false, -- so it's available immediately
}
