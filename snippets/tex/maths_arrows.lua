local M = require("user.helpers")
local in_mathzone = M.in_mathzone

return {
	s({
		trig = "=>",
		snippetType = "autosnippet",
		wordTrig = false,
	}, {
		t("\\Rightarrow"),
	}, {
		condition = in_mathzone,
	}),
    
	s({
		trig = "->",
		snippetType = "autosnippet",
		wordTrig = false,
	}, {
		t("\\rightarrow"),
	}, {
		condition = in_mathzone,
	}),

	s({
		trig = "<=",
		snippettype = "autosnippet",
		wordTrig = false,
	}, {
		t("\\Leftarrow"),
	}, {
		condition = in_mathzone,
	}),

    s({
		trig = "<-",
		snippettype = "autosnippet",
		wordTrig = false,
	}, {
		t("\\leftarrow"),
	}, {
		condition = in_mathzone,
	}),

	s({
		trig = "<=>",
		snippettype = "autosnippet",
        wordTrig = false,
	}, {
		t("\\Leftrigtarrow"),
	}, {
		condition = in_mathzone,
	}),
}
