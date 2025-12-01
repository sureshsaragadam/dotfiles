-- lua/dap/keymaps.lua

return {
	"mfussenegger/nvim-dap",

	keys = {
		-- ::: Core Debugging :::
		{
			"<F5>",
			function()
				require("dap").continue()
			end,
			desc = "DAP Continue/Start",
		},
		{
			"<F9>",
			function()
				require("dap").toggle_breakpoint()
			end,
			desc = "DAP Toggle Breakpoint",
		},
		{
			"<leader>B",
			function()
				require("dap").set_breakpoint(vim.fn.input("Condition: "))
			end,
			desc = "DAP Conditional Breakpoint",
		},

		-- ::: Stepping :::
		{
			"<F10>",
			function()
				require("dap").step_over()
			end,
			desc = "DAP Step Over",
		},
		{
			"<F11>",
			function()
				require("dap").step_into()
			end,
			desc = "DAP Step Into",
		},
		{
			"<F12>",
			function()
				require("dap").step_out()
			end,
			desc = "DAP Step Out",
		},

		-- ::: UI + Debugger Tools :::
		{
			"<leader>du",
			function()
				require("dapui").toggle()
			end,
			desc = "DAP UI Toggle",
		},
		{
			"<leader>dr",
			function()
				require("dap").repl.open()
			end,
			desc = "DAP REPL",
		},
		{
			"<leader>dl",
			function()
				require("dap").run_last()
			end,
			desc = "DAP Run Last",
		},
		{
			"<leader>de",
			function()
				require("dapui").eval()
			end,
			desc = "DAP Evaluate Under Cursor",
		},
	},
}
