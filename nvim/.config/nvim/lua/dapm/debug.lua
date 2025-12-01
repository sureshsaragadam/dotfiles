-- lua/dap/debug.lua

return {
	"mfussenegger/nvim-dap",
	enabled = true,

	dependencies = {
		"rcarriga/nvim-dap-ui",
		"nvim-neotest/nvim-nio",
		"mason-org/mason.nvim",
		"jay-babu/mason-nvim-dap.nvim",
		"leoluz/nvim-dap-go",
	},

	config = function()
		local dap = require("dap")
		local dapui = require("dapui")

		local ensure_installed = {
			"delve", -- Go
			"python", -- debugpy
			"cppdbg", -- C/C++
			-- Add more only when you need
		}

		require("mason-nvim-dap").setup({
			automatic_installation = true,
			ensure_installed = ensure_installed,

			handlers = {
				function(config)
					require("mason-nvim-dap").default_setup(config)
				end,
			},
		})

		dapui.setup()

		dap.listeners.after.event_initialized["dapui_open"] = function()
			dapui.open()
		end

		dap.listeners.before.event_terminated["dapui_close"] = function()
			dapui.close()
		end

		dap.listeners.before.event_exited["dapui_close"] = function()
			dapui.close()
		end
		require("dap-go").setup({})
	end,
}
