-- dap-js.lua
return {
	{
		"microsoft/vscode-js-debug",
		build = "npm ci --ignore-scripts --legacy-peer-deps",
	},

	{
		"mxsdev/nvim-dap-vscode-js",
		dependencies = { "mfussenegger/nvim-dap" },
		config = function()
			local dap = require("dap")

			require("dap-vscode-js").setup({
				node_path = "node",
				debugger_path = vim.fn.stdpath("data") .. "/lazy/vscode-js-debug",
				adapters = {
					"pwa-node",
					"pwa-firefox",
					"pwa-chrome", -- ⭐ ADDED HERE
				},
			})

			-----------------------------------------------------------
			-- 1) Vanilla JavaScript debugging (Node)
			-----------------------------------------------------------
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

			-- Same config for TS
			dap.configurations.typescript = dap.configurations.javascript

			-----------------------------------------------------------
			-- 2) Firefox debugging
			-----------------------------------------------------------
			dap.configurations.javascript[#dap.configurations.javascript + 1] = {
				type = "pwa-firefox",
				request = "launch",
				name = "Launch Firefox (localhost)",
				url = "http://localhost:5500",
				webRoot = vim.fn.getcwd(),
				firefoxExecutable = "/usr/bin/firefox",
			}

			-----------------------------------------------------------
			-- 3) Chrome debugging (⭐ NEW)
			-----------------------------------------------------------
			dap.configurations.javascript[#dap.configurations.javascript + 1] = {
				type = "pwa-chrome",
				request = "launch",
				name = "Launch Chrome (localhost)",
				url = "http://localhost:5500", -- change this URL
				webRoot = vim.fn.getcwd(),
				runtimeExecutable = "google-chrome-stable", -- or chromium
			}

			-- Apply all configs to TypeScript
			dap.configurations.typescript = dap.configurations.javascript
		end,
	},
}
