-- lua/plugins/dap/core.lua

return {
	setup = function()
		local dap = require("dap")
		local dapui = require("dapui")

		require("dapui").setup()

		-- Auto-open UI
		dap.listeners.after.event_initialized["dapui_open"] = function()
			dapui.open()
		end
		dap.listeners.before.event_terminated["dapui_close"] = function()
			dapui.close()
		end
		dap.listeners.before.event_exited["dapui_close"] = function()
			dapui.close()
		end

		-- Mason DAP install list
		require("mason-nvim-dap").setup({
			ensure_installed = {
				"delve", -- go
				"python", -- debugpy
				"cppdbg", -- C/C++
			},
			automatic_installation = true,
			handlers = {
				function(config)
					require("mason-nvim-dap").default_setup(config)
				end,
			},
		})

		-- Go adapter
		require("dap-go").setup()
	end,
}
