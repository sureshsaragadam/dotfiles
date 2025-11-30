-- dap-js.lua
-- Vanilla JavaScript + Node (pwa-node) + Firefox (pwa-firefox)

return {
	-- Install VSCode JavaScript Debugger (no Playwright)
	{
		"microsoft/vscode-js-debug",
		build = "npm ci --ignore-scripts --legacy-peer-deps",
	},

	-- Neovim wrapper for VSCode JS debugger
	{
		"mxsdev/nvim-dap-vscode-js",
		dependencies = { "mfussenegger/nvim-dap" },
		config = function()
			local dap = require("dap")

			-- Setup the debugger
			require("dap-vscode-js").setup({
				node_path = "node", -- your system Node
				debugger_path = vim.fn.stdpath("data") .. "/lazy/vscode-js-debug",
				adapters = {
					"pwa-node",
					"pwa-firefox",
				},
			})

			-----------------------------------------------------------
			-- 1) Vanilla JavaScript debugging using pwa-node (local)
			-----------------------------------------------------------
			dap.configurations.javascript = {
				{
					type = "pwa-node",
					request = "launch",
					name = "Launch current file (Node)",
					program = "${file}", -- run the current JS file
					cwd = vim.fn.getcwd(), -- current project folder
					console = "integratedTerminal",
				},
			}

			-----------------------------------------------------------
			-- Same config for TypeScript (optional)
			-----------------------------------------------------------
			dap.configurations.typescript = dap.configurations.javascript

			-----------------------------------------------------------
			-- 2) Firefox debugging (local)
			-----------------------------------------------------------
			dap.configurations.javascript[#dap.configurations.javascript + 1] = {
				type = "pwa-firefox",
				request = "launch",
				name = "Launch Firefox (localhost)",
				url = "http://localhost:5500", -- change to your local dev server
				webRoot = vim.fn.getcwd(),
				firefoxExecutable = "/usr/bin/firefox",
			}

			dap.configurations.typescript = dap.configurations.javascript
		end,
	},
}
