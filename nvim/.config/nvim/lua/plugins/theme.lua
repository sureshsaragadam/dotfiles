return {
	"khoido2003/monokai-v2.nvim",
	priority = 1000,
	config = function()
		require("monokai-v2").setup()

		vim.cmd("colorscheme monokai-v2")

		-- 🔑 monokai-v2 reapplies highlights, so we must re-link AFTER
		vim.api.nvim_create_autocmd("ColorScheme", {
			pattern = "monokai-v2",
			callback = function()
				vim.api.nvim_set_hl(0, "StatusLine", { link = "NormalFloat" })
				vim.api.nvim_set_hl(0, "StatusLineNC", { link = "Comment" })

				-- optional but recommended
				vim.api.nvim_set_hl(0, "StlLSP", { link = "DiagnosticInfo" })
				vim.api.nvim_set_hl(0, "StlFileIcon", { link = "Special" })
			end,
		})
	end,
}
