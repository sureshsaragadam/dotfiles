-- lua/lspm/keymaps.lua

return {
	on_attach = function(event)
		local map = function(keys, func, desc, mode)
			mode = mode or "n"
			vim.keymap.set(mode, keys, func, { buffer = event.buf, desc = "LSP: " .. desc })
		end

		-- Rename
		map("grn", vim.lsp.buf.rename, "Rename")

		-- Code Action
		map("gra", vim.lsp.buf.code_action, "Code Action", { "n", "x" })

		-- References
		map("grr", require("telescope.builtin").lsp_references, "References")

		-- Implementation
		map("gri", require("telescope.builtin").lsp_implementations, "Implementation")

		-- Definition
		map("grd", require("telescope.builtin").lsp_definitions, "Definition")

		-- Declaration
		map("grD", vim.lsp.buf.declaration, "Declaration")

		-- Symbols
		map("gO", require("telescope.builtin").lsp_document_symbols, "Document Symbols")
		map("gW", require("telescope.builtin").lsp_dynamic_workspace_symbols, "Workspace Symbols")

		-- Type Definition
		map("grt", require("telescope.builtin").lsp_type_definitions, "Type Definition")

		-- Toggle Inlay Hints
		local client = vim.lsp.get_client_by_id(event.data.client_id)
		if client and client.supports_method(vim.lsp.protocol.Methods.textDocument_inlayHint) then
			map("<leader>th", function()
				vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled({ bufnr = event.buf }))
			end, "Toggle Inlay Hints")
		end

		-- Document Highlights
		require("plugins.lsp.highlights").setup(event)
	end,
}
