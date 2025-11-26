local sw = require("config.switch")
return {
	"folke/todo-comments.nvim",
	enabled = sw.todo,
	event = "VimEnter",
	dependencies = { "nvim-lua/plenary.nvim" },
	opts = { signs = false },
}
