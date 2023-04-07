local M = require("user.helpers")
local in_mathzone = M.in_mathzone
local not_latex_command = M.not_latex_command

return {
	s(
		{ trig = "bar", descr = "\\bar{}", snippetType = "autosnippet" },
		fmta(
			[[
      \bar{<>}
      ]],
			{ i(1) }
		),
		{ condition = in_mathzone * not_latex_command }
	),

	s(
		{ trig = "ovl", descr = "\\overline{}", snippetType = "autosnippet" },
		fmta(
			[[
      \overline{<>}
      ]],
			{ i(1) }
		),
		{ condition = in_mathzone * not_latex_command }
	),

	s(
		{ trig = "trm", descr = "Text env in maths mode", snippetType = "autosnippet" },
		fmta(
			[[
      \textrm{<>}
      ]],
			{ i(1) }
		),
		{ condition = not_latex_command }
	),

	s(
		{ trig = "tsc", descr = "\\textsc{}", snippetType = "autosnippet" },
		fmta(
			[[
      \textsc{<>}
      ]],
			{ i(1) }
		),
		{ condition = not_latex_command }
	),

	s(
		{ trig = "ttt", descr = "\\texttt{}", snippetType = "autosnippet" },
		fmta(
			[[
      \texttt{<>}
      ]],
			{ i(1) }
		),
		{ condition = not_latex_command }
	),

	s(
		{ trig = "tbf", descr = "\\textbf{}", snippetType = "autosnippet" },
		fmta(
			[[
      \textbf{<>}
      ]],
			{ i(1) }
		),
		{ condition = not_latex_command }
	),

	s(
		{ trig = "tit", descr = "\\textit{}", snippetType = "autosnippet" },
		fmta(
			[[
      \textit{<>}
      ]],
			{ i(1) }
		),
		{ condition = not_latex_command }
	),

	s(
		{ trig = "sum", descr = "\\sum_{}^{}", snippetType = "autosnippet" },
		fmta(
			[[
      \sum_{k=<>}^{<>} <>
      ]],
			{ i(1, "0"), i(2, "n"), i(3) }
		),
		{ condition = in_mathzone * not_latex_command }
	),

	s(
		{ trig = "prod", descr = "\\prod_{}^{}", snippetType = "autosnippet" },
		fmta(
			[[
      \prod_{k=<>}^{<>} <>
      ]],
			{ i(1, "0"), i(2, "n"), i(3) }
		),
		{ condition = in_mathzone * not_latex_command }
	),

	s(
		{ trig = "mbb", descr = "\\mathbb{}", snippetType = "autosnippet" },
		fmta(
			[[
      \mathbb{<>}
      ]],
			{ i(1) }
		),
		{ condition = in_mathzone }
	),

	s(
		{ trig = "mds", descr = "\\mathds{}", snippetType = "autosnippet" },
		fmta(
			[[
      \mathds{<>}
      ]],
			{ i(1, "1") }
		),
		{ condition = in_mathzone }
	),

	s(
		{ trig = "ff", descr = "\\frac{}{}", snippetType = "autosnippet" },
		fmta(
			[[
      \frac{<>}{<>}
      ]],
			{ i(1, "1"), i(2, "2") }
		),
		{ condition = in_mathzone * not_latex_command }
	),

	s(
		{ trig = "uds", descr = "\\underset{}{}", snippetType = "autosnippet" },
		fmta(
			[[
      \underset{<>}{<>}
      ]],
			{ i(1, "n \\rightarrow \\infty"), i(2, "\\lim") }
		),
		{ condition = in_mathzone }
	),

	s(
		{ trig = "ovs", descr = "\\overset{}{}", snippetType = "autosnippet" },
		fmta(
			[[
      \overset{<>}{<>}
      ]],
			{ i(1), i(2, "\\rightarrow") }
		),
		{ condition = in_mathzone }
	),

	s(
		{ trig = "ee", descr = "e^{}", snippetType = "autosnippet" },
		fmta(
			[[
      e^{<>}
      ]],
			{ i(1, "x") }
		),
		{ condition = in_mathzone * not_latex_command }
	),

    s(
		{ trig = "sqrt", descr = "\\sqrt{}", snippetType = "autosnippet" },
		fmta(
			[[
      \sqrt{<>}
      ]],
			{ i(1, "x") }
		),
		{ condition = in_mathzone * not_latex_command }
	),

    s(
		{ trig = "int", descr = "\\int", snippetType = "autosnippet" },
		fmta(
			[[
      \int_{<>}^{<>} <><>
      ]],
			{ i(1, "a"), i(2, "b"), i(3, "f(t)"), i(4, "dt")}
		),
		{ condition = in_mathzone * not_latex_command }
	),
}
