-- lua/plugins/dap/keymaps.lua
return {
	setup = function()
		local dap = require("dap")
		local dapui = require("dapui")

		-- Continue / run
		vim.keymap.set("n", "<F5>", dap.continue, { desc = "DAP Continue" })

		-- Breakpoints
		vim.keymap.set("n", "<F9>", dap.toggle_breakpoint, { desc = "DAP Toggle Breakpoint" })
		vim.keymap.set("n", "<leader>B", function()
			dap.set_breakpoint(vim.fn.input("Condition: "))
		end, { desc = "DAP Conditional Breakpoint" })

		-- Stepping
		vim.keymap.set("n", "<F10>", dap.step_over, { desc = "DAP Step Over" })
		vim.keymap.set("n", "<F11>", dap.step_into, { desc = "DAP Step Into" })
		vim.keymap.set("n", "<F12>", dap.step_out, { desc = "DAP Step Out" })

		-- UI & tools
		vim.keymap.set("n", "<leader>du", dapui.toggle, { desc = "DAP UI Toggle" })
		vim.keymap.set("n", "<leader>dr", dap.repl.open, { desc = "DAP REPL" })
		vim.keymap.set("n", "<leader>dl", dap.run_last, { desc = "DAP Run Last" })
		vim.keymap.set("n", "<leader>de", dapui.eval, { desc = "DAP Eval" })
	end,
}
