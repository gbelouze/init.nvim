local M = require("user.helpers")
local in_mathzone = M.in_mathzone

return {
    s(
        { trig = "__", snippetType = "autosnippet", wordTrig = false },
        fmta(
            [[
        _{<>}
      ]]     ,
            { i(1) }
        ),
        {
            condition = in_mathzone,
        }
    ),

    s(
        { trig = "^^", snippetType = "autosnippet", wordTrig = false },
        fmta(
            [[
        ^{<>}
      ]]     ,
            { i(1) }
        ),
        {
            condition = in_mathzone,
        }
    ),
}
