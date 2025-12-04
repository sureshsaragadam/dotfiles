vim.api.nvim_create_user_command("ClearRegisters", function()
	for _, reg in ipairs({ '"', "0", "1", "2", "3", "4", "5", "6", "7", "8", "9", "+", "*" }) do
		vim.fn.setreg(reg, "")
	end
end, {})
