return {
	"stevearc/oil.nvim",
	opts = {},
	dependencies = {
		-- Optional: choose an icon provider
		{ "nvim-mini/mini.icons", opts = {} },
		-- or
		-- { "nvim-tree/nvim-web-devicons", opts = {} },
	},
	lazy = false, -- Not recommended to lazy load due to complexity
}
