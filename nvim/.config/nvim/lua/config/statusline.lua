--------------------------------------------------
-- SAFE requires
--------------------------------------------------
local ok_devicons, devicons = pcall(require, "utils.devicons")
if not ok_devicons then
	devicons = nil
end

--------------------------------------------------
-- Global statusline (single bar for all windows)
--------------------------------------------------
vim.opt.laststatus = 3

--------------------------------------------------
-- Providers (GLOBAL for statusline)
--------------------------------------------------

-- MODE
function _G.stl_mode()
	local m = vim.fn.mode()
	local map = {
		n = "NORMAL",
		i = "INSERT",
		v = "VISUAL",
		V = "V-LINE",
		["\22"] = "V-BLOCK",
		c = "COMMAND",
		R = "REPLACE",
		t = "TERMINAL",
	}
	return map[m] or m
end

-- FILENAME
function _G.stl_filename()
	local name = vim.fn.expand("%:t")
	return name ~= "" and name or "[No Name]"
end

-- FILETYPE
function _G.stl_filetype()
	local ft = vim.bo.filetype
	return ft ~= "" and ft:upper() or "NOFT"
end

-- GIT BRANCH highlight (icon + name)
vim.api.nvim_set_hl(0, "StlGitBranch", {
	fg = vim.api.nvim_get_hl(0, { name = "Identifier", link = false }).fg,
	bg = nil,
	bold = true,
})

-- GIT BRANCH
function _G.stl_git()
	return vim.b.gitsigns_head and (" " .. vim.b.gitsigns_head) or ""
end

-- GIT DIFF
function _G.stl_git_diff()
	local gsd = vim.b.gitsigns_status_dict
	if not gsd then
		return ""
	end

	local parts = {}
	if gsd.added and gsd.added > 0 then
		table.insert(parts, "+" .. gsd.added)
	end
	if gsd.changed and gsd.changed > 0 then
		table.insert(parts, "~" .. gsd.changed)
	end
	if gsd.removed and gsd.removed > 0 then
		table.insert(parts, "-" .. gsd.removed)
	end

	return table.concat(parts, " ")
end

-- DIAGNOSTICS (plain text only)
function _G.stl_diag()
	local d = vim.diagnostic
	local out = {}

	local e = #d.get(0, { severity = d.severity.ERROR })
	local w = #d.get(0, { severity = d.severity.WARN })

	if e > 0 then
		table.insert(out, "E" .. e)
	end
	if w > 0 then
		table.insert(out, "W" .. w)
	end

	return table.concat(out, " ")
end

--------------------------------------------------
-- FILE ICON (PLAIN TEXT RETURN)
--------------------------------------------------
function _G.stl_file_icon()
	if not devicons or not devicons.get_icon_color then
		return ""
	end

	local fname = vim.fn.expand("%:t")
	local ext = vim.fn.expand("%:e")

	local icon, color = devicons.get_icon_color(fname, ext)
	if not icon then
		return ""
	end

	-- define highlight, but DO NOT return %#...#
	vim.api.nvim_set_hl(0, "StlFileIcon", { fg = color })

	return icon
end

--------------------------------------------------
-- LSP ICON + NAME (PLAIN TEXT RETURN)
--------------------------------------------------
local lsp_icons = {
	lua_ls = { "", "#51a0cf" },
	html = { "", "#e34c26" },
	cssls = { "", "#563d7c" },
	ts_ls = { "", "#3178c6" },
	tsserver = { "", "#3178c6" },
	pyright = { "", "#3572A5" },
	clangd = { "", "#6d8086" },
}

function _G.stl_lsp_icon()
	local clients = vim.lsp.get_clients({ bufnr = 0 })
	if #clients == 0 then
		return ""
	end

	local c = clients[1]
	local icon, color = "", nil

	if lsp_icons[c.name] then
		icon, color = unpack(lsp_icons[c.name])
	end

	-- define highlight safely
	vim.api.nvim_set_hl(0, "StlLSP", {
		fg = color or vim.api.nvim_get_hl(0, { name = "DiagnosticInfo" }).fg,
		bold = true,
	})

	return icon .. " " .. c.name
end

local function set_mode_hl(mode)
	local map = {
		n = "NormalFloat",
		i = "String",
		v = "Keyword",
		V = "Keyword",
		["\22"] = "Keyword",
		c = "Function",
		R = "ErrorMsg",
	}

	vim.api.nvim_set_hl(0, "StlMode", { link = map[mode] or "NormalFloat" })
end

vim.api.nvim_create_autocmd("ModeChanged", {
	callback = function()
		set_mode_hl(vim.fn.mode())
	end,
})

set_mode_hl(vim.fn.mode())

--------------------------------------------------
-- STATUSLINE LAYOUT (ALL HIGHLIGHTS HERE)
--------------------------------------------------
vim.opt.statusline = table.concat({
	" ",
	"%#StlMode#%{v:lua.stl_mode()}%#StatusLine#",
	" | ",
	"%#StlFileIcon#%{v:lua.stl_file_icon()}%#StatusLine# ",
	"%{v:lua.stl_filename()}",
	" %m ",
	"[%{v:lua.stl_filetype()}] ",
	"%#StlGitBranch#%{v:lua.stl_git()}%#StatusLine# ",
	"%#DiffAdd#%{v:lua.stl_git_diff()}%#StatusLine# ",
	"%=",
	"%#DiagnosticError#%{v:lua.stl_diag()}%#StatusLine# ",
	"%#StlLSP#%{v:lua.stl_lsp_icon()}%#StatusLine# ",
	"%l:%c ",
})
