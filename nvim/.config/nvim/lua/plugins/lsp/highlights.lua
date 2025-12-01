return {
	setup = function(event)
		local client = vim.lsp.get_client_by_id(event.data.client_id)
		if not client then
			return
		end

		if not client.supports_method(vim.lsp.protocol.Methods.textDocument_documentHighlight) then
			return
		end

		local group = vim.api.nvim_create_augroup("lsp-highlight", { clear = false })

		vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
			group = group,
			buffer = event.buf,
			callback = vim.lsp.buf.document_highlight,
		})

		vim.api.nvim_create_autocmd({ "CursorMoved", "CursorMovedI" }, {
			group = group,
			buffer = event.buf,
			callback = vim.lsp.buf.clear_references,
		})
	end,
}
