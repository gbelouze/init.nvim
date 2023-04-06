local line_begin = require("luasnip.extras.expand_conditions").line_begin

return {
	s(
		{ trig = "texroot", snippetType = "autosnippet" },
		fmta(
			[[
            %! TEX root = <>
          ]],
			{ i(1, "../main.tex") }
		),
		{ condition = line_begin }
	),
}
