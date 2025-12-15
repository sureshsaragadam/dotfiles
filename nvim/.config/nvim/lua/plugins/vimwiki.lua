return {
	"vimwiki/vimwiki",
	init = function()
		-- Important: disable default mappings if you want full control
		vim.g.vimwiki_global_ext = 0

		vim.g.vimwiki_list = {
			{
				path = "~/vimwiki/",
				syntax = "markdown",
				ext = ".md",
			},
		}
	end,
}
