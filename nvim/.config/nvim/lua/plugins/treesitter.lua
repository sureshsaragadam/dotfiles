return {
	{
		-- 🌳 Tree-sitter core
		"nvim-treesitter/nvim-treesitter",
		lazy = false,
		build = ":TSUpdate",

		main = "nvim-treesitter.configs",

		opts = {
			ensure_installed = {
				"bash",
				"c",
				"cpp",
				"lua",
				"javascript",
				"typescript",
				"tsx",
				"json",
				"html",
				"css",
				"markdown",
				"markdown_inline",
			},

			auto_install = true,

			highlight = {
				enable = true,
			},

			indent = {
				enable = true,
			},

			-- 🌳 Textobjects (official defaults)
			textobjects = {
				select = {
					enable = true,
					lookahead = true,
					keymaps = {
						["af"] = "@function.outer",
						["if"] = "@function.inner",
						["ac"] = "@class.outer",
						["ic"] = "@class.inner",
					},
				},

				move = {
					enable = true,
					set_jumps = true,
					goto_next_start = {
						["]m"] = "@function.outer",
						["]c"] = "@class.outer",
					},
					goto_next_end = {
						["]M"] = "@function.outer",
						["]C"] = "@class.outer",
					},
					goto_previous_start = {
						["[m"] = "@function.outer",
						["[c"] = "@class.outer",
					},
					goto_previous_end = {
						["[M"] = "@function.outer",
						["[C"] = "@class.outer",
					},
				},
			},
		},

		config = function()
			-- Tree-sitter folding (official & stable)
			vim.opt.foldmethod = "expr"
			vim.opt.foldexpr = "v:lua.vim.treesitter.foldexpr()"
			vim.opt.foldlevel = 99
		end,
	},
}
