--luasnip.lua
local ls = require("luasnip")
local helpers = require("helperfunc")
local get_visual = helpers.get_visual
local s = ls.snippet
-- local sn = ls.snippet_node
local t = ls.text_node
local i = ls.insert_node
local c = ls.choice_node
-- local f = ls.function_node
local d = ls.dynamic_node
local fmt = require("luasnip.extras.fmt").fmt
local fmta = require("luasnip.extras.fmt").fmta
-- local rep = require("luasnip.extras").rep

return {
  s({ trig = "tii", dscr = "Typst emphasis (italics).", wordTrig=false },
    fmta("#emph[<>]", { d(1, get_visual) })
  ),
  s({ trig = "tbb", dscr = "Typst bold.", wordTrig=false },
    fmta("#strong[<>]", { d(1, get_visual) })
  ),
  s({ trig = "matc", dscr = "Typst calligraphic style.", wordTrig=false },
    fmta("cal(<>)", { d(1, get_visual) })
  ),
  s({ trig = ";M", dscr = "Math Mode AUTO", snippetType="autosnippet", wordTrig=false},
    fmta("$<>$", { d(1, get_visual) })),
  s({ trig = "matb", dscr = "Typst bloackboard bold.", wordTrig=false },
    fmta("bb(<>)", { d(1, get_visual) })
  ),
  s({ trig = "text", dscr = "Typst text environment.", wordTrig=false },
    fmta('text("<>")', { d(1, get_visual) })
  ),
  s({ trig = "quo", dscr = "Quote.", wordTrig=false },
    fmta("“<>”", { d(1, get_visual) })),
  s({ trig = "lbl", dscr = "Label", wordTrig=false },
    fmt("<{}:{}>", { c(1,{ t("eq"), t("fig"), t("tbl") }) , i(2)})
  ),
  s({ trig = "fig", dscr = "Figure", wordTrig = false },
    fmta([[
      #figure(
        image("<>", width: <>%),
        caption: [<>],
      )<>
    ]], { i(1), i(2), i(3), i(0) })
  ),
  s({ trig = "lr", dscr = "Left Right Wrapper.", wordTrig=false },
    fmta("lr(<>)", { d(1, get_visual) })),
}
