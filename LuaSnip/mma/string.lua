--luasnip.lua
local ls = require("luasnip")
local helpers = require("helperfunc")
local get_visual=helpers.get_visual
local s = ls.snippet
local sn = ls.snippet_node
local t = ls.text_node
local i = ls.insert_node
-- local f = ls.function_node
local d = ls.dynamic_node
-- local fmt = require("luasnip.extras.fmt").fmt
local fmta = require("luasnip.extras.fmt").fmta
-- local rep = require("luasnip.extras").rep

return{
  s({ trig = "f1", dscr = "F with one lower index" },
    fmt('F[DN["{}"]]', {
      i(1, "A"),
    })
  ),

  s({ trig = "f3", dscr = "F with three lower indices" },
    fmt('F[DN["{}"], DN["{}"], DN["{}"]]', {
      i(1, "A"),
      i(2, "B"),
      i(3, "C"),
    })
  ),
  s({ trig = "pu", dscr = "PU with two upper indices" },
    fmt('PU[UP["{}"], UP["{}"]]', {
      i(1, "A"),
      i(2, "B"),
    })
  ),

  s({ trig = "pd", dscr = "PD with two upper indices" },
    fmt('PD[UP["{}"], UP["{}"]]', {
      i(1, "A"),
      i(2, "B"),
    })
  ),

  s({ trig = "et", dscr = "eta with two upper indices" },
    fmt('\\[Eta][UP["{}"], UP["{}"]]', {
      i(1, "A"),
      i(2, "B"),
    })
  ),
  s({ trig = "de", dscr = "delta E with two lower indices" },
    fmt('\\[Delta]E[DN["{}"], DN["{}"]]', {
      i(1, "A"),
      i(2, "B"),
    })
  ),
  s({ trig = "lam", dscr = "Lambda with two lower indices" },
    fmt('\\[CapitalLambda]E[DN["{}"], DN["{}"]]', {
      i(1, "A"),
      i(2, "B"),
    })
  ),
  s({ trig = "beta", dscr = "beta with two lower indices" },
    fmt('\\[Beta]{}[DN["{}"], DN["{}"]]', {
      i(1, "1"),
      i(2, "A"),
      i(3, "B"),
    })
  ),
  s({ trig = "fd", dscr = "Fd derivative of any tensor expression" },
    fmt('Fd[{}, {}["{}"]]', {
      i(1, ""),
      c(2, { t("DN"), t("UP") }),
      i(3, "A"),
    })
  ),
  s({ trig = "del", dscr = "CapitalDelta acting on expression" },
    fmt("\\[CapitalDelta][{}][{}]", {
      i(1, "\\[CapitalLambda]"),
      i(2, "expr"),
    })
  ),
}
