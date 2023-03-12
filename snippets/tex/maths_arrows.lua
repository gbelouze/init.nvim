local M = require("user.helpers")
local in_mathzone = M.in_mathzone
local not_latex_command = M.not_latex_command

return {
	s({
		trig = "RA",
		snippetType = "autosnippet",
	}, {
		t("\\Rightarrow"),
	}, {
		condition = in_mathzone * not_latex_command,
	}),
    
	s({
		trig = "ra",
		snippetType = "autosnippet",
	}, {
		t("\\rightarrow"),
	}, {
		condition = in_mathzone * not_latex_command,
	}),

	s({
		trig = "La",
		snippetType = "autosnippet",
	}, {
		t("\\Leftarrow"),
	}, {
		condition = in_mathzone * not_latex_command,
	}),

    s({
		trig = "la",
		snippetType = "autosnippet",
	}, {
		t("\\leftarrow"),
	}, {
		condition = in_mathzone * not_latex_command,
	}),

	s({
		trig = "Lra",
		snippetType = "autosnippet",
	}, {
		t("\\Leftrightarrow"),
	}, {
		condition = in_mathzone * not_latex_command,
	}),
}
