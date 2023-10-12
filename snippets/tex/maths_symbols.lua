local M = require("user.helpers")
local in_mathzone = M.in_mathzone
local not_latex_command = M.not_latex_command

return {
    s({
        trig = "inf",
        desc = "infinity",
        snippetType = "autosnippet",
    }, {
        t("\\infty"),
    }, { condition = in_mathzone * not_latex_command }),
    s({
        trig = "st",
        desc = "such that",
        snippetType = "autosnippet",
    }, {
        t("\\; | \\; "),
    }, { condition = in_mathzone * not_latex_command }),
    s({
        trig = "fa",
        snippetType = "autosnippet",
    }, {
        t("\\forall"),
    }, { condition = in_mathzone * not_latex_command }),
    s({
        trig = "ex",
        snippetType = "autosnippet",
    }, {
        t("\\exists"),
    }, { condition = in_mathzone * not_latex_command }),
    s({
        trig = "...",
        snippetType = "autosnippet",
        wordTrig = false,
    }, {
        t("\\ldots"),
    }, { condition = in_mathzone }),
    s({
        trig = ";a",
        snippetType = "autosnippet",
        wordTrig = false,
    }, {
        t("\\alpha"),
    }, { condition = in_mathzone }),
    s({
        trig = ";b",
        snippetType = "autosnippet",
        wordTrig = false,
    }, {
        t("\\beta"),
    }, { condition = in_mathzone }),
    s({
        trig = ";g",
        snippetType = "autosnippet",
        wordtrig = false,
    }, {
        t("\\gamma"),
    }, { condition = in_mathzone }),
    s({
        trig = ";d",
        snippetType = "autosnippet",
        wordtrig = false,
    }, {
        t("\\delta"),
    }, { condition = in_mathzone }),
    s({
        trig = ";e",
        snippetType = "autosnippet",
        wordtrig = false,
    }, {
        t("\\varepsilon"),
    }, { condition = in_mathzone }),
    s({
        trig = ";p",
        snippetType = "autosnippet",
        wordtrig = false,
    }, {
        t("\\psi"),
    }, { condition = in_mathzone }),
    s({
        trig = ";f",
        snippetType = "autosnippet",
        wordtrig = false,
    }, {
        t("\\phi"),
    }, { condition = in_mathzone }),
    s({
        trig = ";m",
        snippetType = "autosnippet",
        wordtrig = false,
    }, {
        t("\\mu"),
    }, { condition = in_mathzone }),
    s({
        trig = ";n",
        snippetType = "autosnippet",
        wordtrig = false,
    }, {
        t("\\nu"),
    }, { condition = in_mathzone }),
    s({
        trig = ";o",
        snippetType = "autosnippet",
        wordtrig = false,
    }, {
        t("\\omega"),
    }, { condition = in_mathzone }),
    s({
        trig = ";s",
        snippetType = "autosnippet",
        wordtrig = false,
    }, {
        t("\\sigma"),
    }, { condition = in_mathzone }),
    s({
        trig = ";h",
        snippetType = "autosnippet",
        wordtrig = false,
    }, {
        t("\\theta"),
    }, { condition = in_mathzone }),
    s({
        trig = ";l",
        snippetType = "autosnippet",
        wordtrig = false,
    }, {
        t("\\lambda"),
    }, { condition = in_mathzone }),
    s({
        trig = ";r",
        snippetType = "autosnippet",
        wordtrig = false,
    }, {
        t("\\rho"),
    }, { condition = in_mathzone }),
    s({
        trig = ";t",
        snippetType = "autosnippet",
        wordtrig = false,
    }, {
        t("\\tau"),
    }, { condition = in_mathzone }),
    s({
        trig = ";y",
        snippetType = "autosnippet",
        wordtrig = false,
    }, {
        t("\\pi"),
    }, { condition = in_mathzone }),
}
