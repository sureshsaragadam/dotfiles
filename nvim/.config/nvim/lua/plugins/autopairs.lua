-- autopairs
-- https://github.com/windwp/nvim-autopairs
local sw = require("config.switch")

return {
	"windwp/nvim-autopairs",
	enabled = sw.autopairs,
	event = "InsertEnter",
	opts = {},
}
