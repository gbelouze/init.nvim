return {
	s(
		{ trig = "math", desc = "Neorg math block" },
		fmta(
			[[
    @math
    <>
    @end
    ]],
			{ i(1) }
		),
		{}
	),
	s(
		{ trig = "image", desc = ".image url" },
		fmta( ".image <>",
			{ i(1, url) }
		),
		{}
	),
}
