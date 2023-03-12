local M = {}
local ls = require("luasnip")
local make_condition = require("luasnip.extras.conditions").make_condition

-- LuaSnip
local function in_mathzone()
	return vim.fn["vimtex#syntax#in_mathzone"]() == 1
end

M.in_mathzone = make_condition(in_mathzone)

local function not_latex_command(line_to_cursor, matched_trigger, captures)
    -- check that the trigger does not follow a '\' character
    return line_to_cursor:sub(-(#matched_trigger + 1), -(#matched_trigger + 1)) ~= '\\'
end

M.not_latex_command = make_condition(not_latex_command)

function M.recover_capture()
	return ls.function_node(function(_, snip)
		return snip.captures[1]
	end)
end

return M
