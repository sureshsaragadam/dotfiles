-- lua/plugins/dap.lua
return {
	{
		"mfussenegger/nvim-dap",
		dependencies = {
			"rcarriga/nvim-dap-ui",
			"nvim-neotest/nvim-nio",
			"jay-babu/mason-nvim-dap.nvim",
			"leoluz/nvim-dap-go",
			-- JS Debugger
			{
				"microsoft/vscode-js-debug",
				build = "npm ci --legacy-peer-deps",
			},
			{
				"mxsdev/nvim-dap-vscode-js",
				dependencies = { "mfussenegger/nvim-dap" },
			},
		},

		config = function()
			-- load core configuration
			require("plugins.dap.core").setup()
			-- load keymaps
			require("plugins.dap.keymaps").setup()
			-- load adapters
			require("plugins.dap.cpp").setup()
			require("plugins.dap.js").setup()
		end,
	},
}
