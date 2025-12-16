local M = {}

local ok, devicons = pcall(require, "nvim-web-devicons")
if not ok then
	return M
end

function M.get_icon_color(name, ext)
	return devicons.get_icon_color(name, ext, { default = true })
end

return M
