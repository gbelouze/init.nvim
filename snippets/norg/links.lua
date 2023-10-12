return {
    s({ trig = "lk ", desc = "{url}[]", snippetType = "autosnippet" }, fmta("{<>}[<>]", { i(1), i(2) }), {}),
    s({ trig = "lk:", desc = "{:norgpath:}[]", snippetType = "autosnippet" }, fmta("{:<>:}[<>]", { i(1), i(2) }), {}),
    s({ trig = "lk*", desc = "{* Heading}[]", snippetType = "autosnippet" }, fmta("{* <>}[<>]", { i(1), i(2) }), {}),
    s({ trig = "lk#", desc = "{# Magic}[]", snippetType = "autosnippet" }, fmta("{# <>}[<>]", { i(1), i(2) }), {}),
    s({ trig = "lk/", desc = "{/ filepath}[]", snippetType = "autosnippet" }, fmta("{/ <>}[<>]", { i(1, "path"), i(2) }), {}),
    s({ trig = "anchr", desc = "[anchor]{definition}", snippetType = "autosnippet" }, fmta("[<>]{<>}", { i(1, "anchor"), i(2, "definition") }), {}),
}
