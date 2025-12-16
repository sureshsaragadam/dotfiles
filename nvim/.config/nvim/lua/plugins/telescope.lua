-- lua/plugins/telescope.lua
return {
	"nvim-telescope/telescope.nvim",
	version = "*",
	cmd = "Telescope",
	dependencies = {
		"nvim-lua/plenary.nvim",
		{
			"nvim-telescope/telescope-fzf-native.nvim",
			build = "make",
			cond = vim.fn.executable("make") == 1,
		},
	},
	opts = {
		defaults = {
			sorting_strategy = "ascending",
			layout_config = {
				prompt_position = "top",
			},
			mappings = {
				i = {
					["<C-n>"] = "move_selection_next",
					["<C-p>"] = "move_selection_previous",
				},
				n = {
					["<C-n>"] = "move_selection_next",
					["<C-p>"] = "move_selection_previous",
				},
			},
		},
	},

	config = function(_, opts)
		local telescope = require("telescope")
		telescope.setup(opts)
		pcall(telescope.load_extension, "fzf")
	end,

	keys = {
		-- Current file directory
		{
			"<leader>ff",
			function()
				require("telescope.builtin").find_files({
					cwd = vim.fn.expand("%:p:h"),
				})
			end,
			desc = "Find files (current dir)",
		},
		{
			"<leader>fg",
			function()
				require("telescope.builtin").live_grep({
					cwd = vim.fn.expand("%:p:h"),
				})
			end,
			desc = "Grep (current dir)",
		},
		{
			"<leader>/",
			function()
				require("telescope.builtin").current_buffer_fuzzy_find()
			end,
			desc = "Fuzzy find (buffer)",
		},
		{
			"<leader>b",
			"<cmd>Telescope buffers<cr>",
			desc = "Buffers",
		},
	},
}
