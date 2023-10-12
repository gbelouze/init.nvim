local M = require("user.helpers")
local in_mathzone = M.in_mathzone
local not_latex_command = M.not_latex_command

return {
	s(
		{ trig = "dot", desc = "\\dot{}", snippetType = "autosnippet" },
		fmta(
			[[
      \dot{<>}
      ]],
			{ i(1) }
		),
		{ condition = in_mathzone * not_latex_command }
	),
	s(
		{ trig = "hat", desc = "\\hat{}", snippetType = "autosnippet" },
		fmta(
			[[
      \hat{<>}
      ]],
			{ i(1) }
		),
		{ condition = in_mathzone * not_latex_command }
	),

	s(
		{ trig = "bar", desc = "\\bar{}", snippetType = "autosnippet" },
		fmta(
			[[
      \bar{<>}
      ]],
			{ i(1) }
		),
		{ condition = in_mathzone * not_latex_command }
	),

	s(
		{ trig = "ovl", desc = "\\overline{}", snippetType = "autosnippet" },
		fmta(
			[[
      \overline{<>}
      ]],
			{ i(1) }
		),
		{ condition = in_mathzone * not_latex_command }
	),

	s(
		{ trig = "trm", desc = "Text env in maths mode", snippetType = "autosnippet" },
		fmta(
			[[
      \textrm{<>}
      ]],
			{ i(1) }
		),
		{ condition = not_latex_command }
	),

	s(
		{ trig = "tsc", desc = "\\textsc{}", snippetType = "autosnippet" },
		fmta(
			[[
      \textsc{<>}
      ]],
			{ i(1) }
		),
		{ condition = not_latex_command }
	),

	s(
		{ trig = "ttt", desc = "\\texttt{}", snippetType = "autosnippet" },
		fmta(
			[[
      \texttt{<>}
      ]],
			{ i(1) }
		),
		{ condition = not_latex_command }
	),

	s(
		{ trig = "tbf", desc = "\\textbf{}", snippetType = "autosnippet" },
		fmta(
			[[
      \textbf{<>}
      ]],
			{ i(1) }
		),
		{ condition = not_latex_command }
	),

	s(
		{ trig = "tit", desc = "\\textit{}", snippetType = "autosnippet" },
		fmta(
			[[
      \textit{<>}
      ]],
			{ i(1) }
		),
		{ condition = not_latex_command }
	),

	s(
		{ trig = "sum", desc = "\\sum_{}^{}", snippetType = "autosnippet" },
		fmta(
			[[
      \sum_{k=<>}^{<>} <>
      ]],
			{ i(1, "0"), i(2, "n"), i(3) }
		),
		{ condition = in_mathzone * not_latex_command }
	),

	s(
		{ trig = "prod", desc = "\\prod_{}^{}", snippetType = "autosnippet" },
		fmta(
			[[
      \prod_{k=<>}^{<>} <>
      ]],
			{ i(1, "0"), i(2, "n"), i(3) }
		),
		{ condition = in_mathzone * not_latex_command }
	),

	s(
		{ trig = "mbb", desc = "\\mathbb{}", snippetType = "autosnippet" },
		fmta(
			[[
      \mathbb{<>}
      ]],
			{ i(1) }
		),
		{ condition = in_mathzone }
	),

	s(
		{ trig = "mds", desc = "\\mathds{}", snippetType = "autosnippet" },
		fmta(
			[[
      \mathds{<>}
      ]],
			{ i(1, "1") }
		),
		{ condition = in_mathzone }
	),

	s(
		{ trig = "ff", desc = "\\frac{}{}", snippetType = "autosnippet" },
		fmta(
			[[
      \frac{<>}{<>}
      ]],
			{ i(1, "1"), i(2, "2") }
		),
		{ condition = in_mathzone * not_latex_command }
	),

	s(
		{ trig = "uds", desc = "\\underset{}{}", snippetType = "autosnippet" },
		fmta(
			[[
      \underset{<>}{<>}
      ]],
			{ i(1, "n \\rightarrow \\infty"), i(2, "\\lim") }
		),
		{ condition = in_mathzone }
	),

	s(
		{ trig = "ovs", desc = "\\overset{}{}", snippetType = "autosnippet" },
		fmta(
			[[
      \overset{<>}{<>}
      ]],
			{ i(1), i(2, "\\rightarrow") }
		),
		{ condition = in_mathzone }
	),

	s(
		{ trig = "ee", desc = "e^{}", snippetType = "autosnippet" },
		fmta(
			[[
      e^{<>}
      ]],
			{ i(1, "x") }
		),
		{ condition = in_mathzone * not_latex_command }
	),

    s(
		{ trig = "sqrt", desc = "\\sqrt{}", snippetType = "autosnippet" },
		fmta(
			[[
      \sqrt{<>}
      ]],
			{ i(1, "x") }
		),
		{ condition = in_mathzone * not_latex_command }
	),

    s(
		{ trig = "int", desc = "\\int", snippetType = "autosnippet" },
		fmta(
			[[
      \int_{<>}^{<>} <><>
      ]],
			{ i(1, "a"), i(2, "b"), i(3, "f(t)"), i(4, "dt")}
		),
		{ condition = in_mathzone * not_latex_command }
	),

    s(
		{ trig = "lrangle", desc = "<...|...>", snippetType = "autosnippet" },
		fmta(
			[[
      \langle <> \; | \; <> \rangle
      ]],
			{ i(1), i(2)}
		),
		{ condition = in_mathzone * not_latex_command }
	),
}
