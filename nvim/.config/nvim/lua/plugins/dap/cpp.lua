-- lua/plugins/dap/cpp.lua

return {
	setup = function()
		local dap = require("dap")

		dap.adapters.gdb = {
			type = "executable",
			command = "gdb",
			args = { "-i", "dap" },
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
