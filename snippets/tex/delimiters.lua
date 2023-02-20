local M = require("user.helpers")
local in_mathzone = M.in_mathzone

return {
    s({
        trig = "\\{",
        snippetType = "autosnippet",
        wordtrig = false,
    }, {
        t("\\{\\}"),
    }, { condition = in_mathzone })
}
