-- lua/plugins/dap/js.lua
return {
	setup = function()
		local dap = require("dap")

		require("dap-vscode-js").setup({
			node_path = "node",
			debugger_path = vim.fn.stdpath("data") .. "/lazy/vscode-js-debug",
			adapters = {
				"pwa-node",
				"pwa-firefox",
				"pwa-chrome",
			},
		})

		-- Node
		dap.configurations.javascript = {
			{
				type = "pwa-node",
				request = "launch",
				name = "Launch current file (Node)",
				program = "${file}",
				cwd = vim.fn.getcwd(),
				console = "integratedTerminal",
			},
		}

		-- Firefox
		table.insert(dap.configurations.javascript, {
			type = "pwa-firefox",
			request = "launch",
			name = "Launch Firefox",
			url = "http://localhost:5500",
			webRoot = vim.fn.getcwd(),
			firefoxExecutable = "/usr/bin/firefox",
		})

		-- Chrome
		table.insert(dap.configurations.javascript, {
			type = "pwa-chrome",
			request = "launch",
			name = "Launch Chrome",
			url = "http://localhost:5500",
			webRoot = vim.fn.getcwd(),
			runtimeExecutable = "google-chrome-stable",
		})

		dap.configurations.typescript = dap.configurations.javascript
	end,
}
