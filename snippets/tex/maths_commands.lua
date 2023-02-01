local M = require("user.helpers")
local in_mathzone = M.in_mathzone

return {
    s(
        { trig = "ttt", descr = "Text env in maths mode", snippetType = "autosnippet" },
        fmta(
            [[
      \texttt{<>}
      ]]     ,
            { i(1) }
        ),
        { condition = in_mathzone }
    ),

    s(
        { trig = "sum", snippetType = "autosnippet" },
        fmta(
            [[
      \sum_{k=<>}^{<>} <>
      ]]     ,
            { i(1, "0"), i(2, "n"), i(3) }
        )
    ),

    s(
        { trig = "prod", snippetType = "autosnippet" },
        fmta(
            [[
      \prod_{k=<>}^{<>} <>
      ]]     ,
            { i(1, "0"), i(2, "n"), i(3) }
        )
    ),

    s(
        { trig = "mbb", descr = "mathbb{}", snippetType = "autosnippet" },
        fmta(
            [[
      \mathbb{<>}
      ]]     ,
            { i(1) }
        )
    ),

    s(
        { trig = "mds", descr = "mathds{}", snippetType = "autosnippet" },
        fmta(
            [[
      \mathds{<>}
      ]]     ,
            { i(1, "1") }
        )
    ),
}
