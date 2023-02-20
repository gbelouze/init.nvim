local M = require("user.helpers")
local in_mathzone = M.in_mathzone

return {
	s({
		trig = "RA",
		snippetType = "autosnippet",
	}, {
		t("\\Rightarrow"),
	}, {
		condition = in_mathzone,
	}),
    
	s({
		trig = "ra",
		snippetType = "autosnippet",
	}, {
		t("\\rightarrow"),
	}, {
		condition = in_mathzone,
	}),

	s({
		trig = "La",
		snippetType = "autosnippet",
	}, {
		t("\\Leftarrow"),
	}, {
		condition = in_mathzone,
	}),

    s({
		trig = "la",
		snippetType = "autosnippet",
	}, {
		t("\\leftarrow"),
	}, {
		condition = in_mathzone,
	}),

	s({
		trig = "Lra",
		snippetType = "autosnippet",
	}, {
		t("\\Leftrigtarrow"),
	}, {
		condition = in_mathzone,
	}),
}
