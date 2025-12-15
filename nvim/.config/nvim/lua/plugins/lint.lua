-- Check available linters
-- :lua print(vim.inspect(require("lint").linters_by_ft))
-- Trigger lint manually
-- :lua require("lint").try_lint()

return {
	"mfussenegger/nvim-lint",
	event = { "BufReadPost", "BufWritePost", "InsertLeave" },
	config = function()
		local lint = require("lint")

		-- Explicit linters only (no defaults)
		lint.linters_by_ft = {
			javascript = { "eslint" },
			html = { "htmlhint" },
			css = { "stylelint" },
			-- lua = { "selene" },

			-- optional / keep only if you really use them
			-- python     = { "flake8" },
			-- c          = { "clangtidy" },
			-- cpp        = { "clangtidy" },
			-- markdown   = { "markdownlint" },
		}

		-- Auto-run linting
		vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave" }, {
			callback = function()
				if vim.bo.modifiable then
					lint.try_lint()
				end
			end,
		})
	end,
}
