return({
    s({ trig = "hr", snippetType = "autosnippet"},
      fmta([[
      \href{<>}{<>}
      ]],
      {i(1, "url"), i(2, "name")})
    ),

    s({ trig = "bf", snippetType = "autosnippet"},
      fmta([[
      \textbf{<>}
      ]],
      {i(1)})
    )
})
