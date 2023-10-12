local line_begin = require("luasnip.extras.expand_conditions").line_begin
local not_latex_command = require("user.helpers").not_latex_command

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
		{ condition = line_begin * not_latex_command }
	),

	s(
		{ trig = "sec", desc = "Section", snippetType = "autosnippet" },
		fmta(
			[[
        \section{<>}
      ]],
			{ i(1) }
		),
		{ condition = line_begin * not_latex_command }
	),

	s(
		{ trig = "ssec", desc = "Subsection", snippetType = "autosnippet" },
		fmta(
			[[
        \subsection{<>}
      ]],
			{ i(1) }
		),
		{ condition = line_begin * not_latex_command }
	),

	s(
		{ trig = "sssec", desc = "Subsubsection", snippetType = "autosnippet" },
		fmta(
			[[
        \subsubsection{<>}
      ]],
			{ i(1) }
		),
		{ condition = line_begin * not_latex_command }
	),

	s(
		{ trig = "mm", desc = "Inline maths", snippetType = "autosnippet" },
		fmta(
			[[
        $ <> $
      ]],
			{ i(1) }
		)
	),

	s(
		{ trig = "MM", desc = "Display maths", snippetType = "autosnippet" },
		fmta(
			[[
        \[
            <>
        \]
      ]],
			{ i(1) }
		)
	),

	s(
		{ trig = "Mm", desc = "Aligned maths", snippetType = "autosnippet" },
		fmta(
			[[


        \begin{align*}
            <>
        \end{align*}
      ]],
			{ i(1) }
		)
	),

	s(
		{ trig = "MNT", desc = "Display minted", snippetType = "autosnippet" },
		fmta(
			[[



        \begin{minted}{<>}
            <>
        \end{minted}
      ]],
			{ i(1, "python"), i(2) }
		)
	),

    s(
		{ trig = "mnt", desc = "Inline minted", snippetType = "autosnippet" },
		fmta(
			[[
        \mintinline{<>}{<>}
      ]],
			{ i(1, "python"), i(2) }
		)
	),
}
