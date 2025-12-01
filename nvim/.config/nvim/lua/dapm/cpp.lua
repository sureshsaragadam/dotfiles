-- lua/dap/cpp_gdb.lua

return {
	"mfussenegger/nvim-dap",

	ft = { "c", "cpp" }, -- Only load for C/C++

	config = function()
		local dap = require("dap")

		dap.adapters.gdb = {
			type = "executable",
			command = "gdb",
			args = { "-i", "dap" }, -- new GDB DAP interface (GDB 13+)
		}

		dap.configurations.cpp = {
			{
				name = "Launch C/C++ Program (GDB)",
				type = "gdb",
				request = "launch",
				program = function()
					return vim.fn.input("Executable: ", vim.fn.getcwd() .. "/", "file")
				end,
				cwd = "${workspaceFolder}",
				stopAtEntry = true,
			},
		}

		dap.configurations.c = dap.configurations.cpp
	end,
}
