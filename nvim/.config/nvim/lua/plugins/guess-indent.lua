return {
	-- Detect tabstop and shiftwidth automatically
	"NMAC427/guess-indent.nvim",
	config = function()
		require("guess-indent").setup({
			auto_set = false,
			max_indent_width = 4,
		})
	end,
}
