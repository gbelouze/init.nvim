local line_begin = require("luasnip.extras.expand_conditions").line_begin

return {
	s(
		{ trig = "env", snippetType = "autosnippet" },
		fmta(
			[[
          \begin{<>}
              <>
          \end{<>}
          ]],
			{ i(1), i(2), rep(1) }
		),
		{ condition = line_begin }
	),

	s(
		{ trig = "sec", descr = "Section", snippetType = "autosnippet" },
		fmta(
			[[
        \section{<>}
      ]],
			{ i(1) }
		),
		{ condition = line_begin }
	),

	s(
		{ trig = "ssec", descr = "Subsection", snippetType = "autosnippet" },
		fmta(
			[[
        \subsection{<>}
      ]],
			{ i(1) }
		),
		{ condition = line_begin }
	),

	s(
		{ trig = "mm", descr = "Inline maths", snippetType = "autosnippet" },
		fmta(
			[[
        $<>$
      ]],
			{ i(1) }
		)
	),

	s(
		{ trig = "MM", descr = "Display maths", snippetType = "autosnippet" },
		fmta(
			[[
        \[
            <>
        \]
      ]],
			{ i(1) }
		)
	),
}
