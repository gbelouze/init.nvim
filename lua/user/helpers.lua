local M = {}

-- LuaSnip
function M.in_mathzone()
	return vim.fn["vimtex#syntax#in_mathzone"]() == 1
end

return M
