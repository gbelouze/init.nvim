return {
	-- Arrows
	s({
		trig = "=>",
		snippetType = "autosnippet",
	}, {
		t("\\Rightarrow"),
	}),

	s({
		trig = "<=",
		snippettype = "autosnippet",
	}, {
		t("\\Leftarrow"),
	}),

	s({
		trig = "<=>",
		snippettype = "autosnippet",
	}, {
		t("\\Leftrigtarrow"),
	}),

	-- Indexing
	s({
		trig = "--1",
		snippetType = "autosnippet",
	}, {
		t("^{-1}"),
	}),
}
