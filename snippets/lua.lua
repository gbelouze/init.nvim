return {
	s(
		{
			trig = "snip",
			dscr = "Create a LuaSnip snippet",
		},
		fmta(
			[[
        s({ trig = "<>", snippetType = "snippet"},
        {
            <>
        }) 
        ]],
			{
				i(1),
				i(2),
			}
		)
	),

	s(
		{
			trig = "fsnip",
			dscr = "Create a LuaSnip snippet using fmta",
		},
		fmta(
			[=[
        s({ trig = "<>", snippetType = "snippet"},
          fmta([[
            <>
          ]],
          {<>}) 
        ]=],
			{
				i(1),
				i(2),
                i(3)
			}
		)
	),

	s(
		{
			trig = "autosnip",
			dscr = " Create a LuaSnip snippet with autosnippet set",
		},
		fmta(
			[[
        s({
            trig = "<>",
            snippetType = "autosnippet",
        }, {
            <>
        })
        ]],
			{
				i(1),
				i(2),
			}
		)
	),

	s(
		{
			trig = "fautosnip",
			dscr = "Create a LuaSnip snippet with autosnippet set using fmta",
		},
		fmta(
			[=[
        s({ trig = "<>", snippetType = "autosnippet"},
          fmta([[
          <>
          ]],
          {<>})
        )
        ]=],
			{
				i(1),
				i(2),
                i(3)
			}
		)
	),
}
