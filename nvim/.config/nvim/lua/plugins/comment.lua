local sw = require("config.switch")

return {
	"echasnovski/mini.comment",
	version = false,
	config = true,

	enabled = sw.comment,
	opts = {},
	lazy = false, -- so it's available immediately
}
