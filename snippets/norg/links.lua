return {
    s({ trig = "lk ", descr = "{url}[]", snippetType = "autosnippet" }, fmta("{<>}[<>]", { i(1), i(2) }), {}),
    s({ trig = "lk:", descr = "{:norgpath:}[]", snippetType = "autosnippet" }, fmta("{:<>:}[<>]", { i(1), i(2) }), {}),
    s({ trig = "lk*", descr = "{* Heading}[]", snippetType = "autosnippet" }, fmta("{* <>}[<>]", { i(1), i(2) }), {}),
    s({ trig = "lk#", descr = "{# Magic}[]", snippetType = "autosnippet" }, fmta("{# <>}[<>]", { i(1), i(2) }), {}),
    s({ trig = "lk/", descr = "{/ nonnorgpath}[]", snippetType = "autosnippet" }, fmta("{/ <>}[<>]", { i(1), i(2) }), {}),
    s({ trig = "anchr", descr = "[anchor]{definition}", snippetType = "autosnippet" }, fmta("[<>]{<>}", { i(1), i(2) }), {}),
}
