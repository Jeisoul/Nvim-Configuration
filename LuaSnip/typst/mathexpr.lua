--luasnip.lua
local ls = require("luasnip")
local helpers = require("helperfunc")
local get_visual=helpers.get_visual
local s = ls.snippet
local sn = ls.snippet_node
local t = ls.text_node
local c = ls.choice_node
local i = ls.insert_node
-- local f = ls.function_node
local d = ls.dynamic_node
-- local fmt = require("luasnip.extras.fmt").fmt
local fmta = require("luasnip.extras.fmt").fmta
local rep = require("luasnip.extras").rep
local function matrix_dynamic(args)
  local rows = tonumber(args[1][1]) or 1
  local cols = tonumber(args[2][1]) or 1

  local nodes, idx = {}, 1
  for r = 1, rows do
    for c = 1, cols do
      table.insert(nodes, i(idx, "0")); idx = idx + 1
      if c < cols then table.insert(nodes, t(" , ")) end
    end
    if r < rows then table.insert(nodes, t({ " ; ", "" })) end
  end

  -- optional: explicit exit position inside the matrix
  table.insert(nodes, i(0))

  return sn(nil, nodes)
end
return{
  s({ trig = "pdv", dscr = "Flexible Partial Derivative", wordTrig = false },
    fmta(
      [[
        (dif<><> <>)/(dif<> <><>)
      ]],
      {
        c(1, { t(""), t("f") }),
        c(2, { t(""), sn(nil, { t("^("), i(1, "2"), t(")") })}),
        i(3, "f"),
        rep(1),
        i(4, "x"),
        rep(2),
      }
    )
  ),
  s({trig="intn",dscr ="N-D momentum integral",wordTrig=false},
    fmta(
      [[
        integral (dif^(<>) <>)/(2 pi)^<>
      ]],
      {
        i(1,"3"),
        i(2,"x"),
        i(3,"3"),
      }
    )
  ),
  s({ trig = "lie", dscr = "Lie derivative",wordTrig=false },
  fmta("cal(L)_(<>)", { i(1) })
  ),
  s({ trig = "cov", dscr = "Covariant derivative",wordTrig=false },
  fmta("nabla_(<>)", { i(1) })
  ),
  s({trig="pow",dscr="Exponent.",wordTrig=false },
    fmta("^(<>)", { i(1) })
  ),
  s({trig="und",dscr="Underscore.",wordTrig=false },
    fmta("_(<>)", { i(1) })
  ),
  s({ trig = "simp", dscr = "Oriented Simplex",wordTrig=false },
    fmta("angle.l <> angle.r", { d(1, get_visual) })
  ),
  s({ trig = "braket", dscr = "Bra-ket",wordTrig=false },
    fmta("angle.l <>|<> angle.r", { d(1, get_visual),i(2) }
    )
  ),
  s({ trig = "mel", dscr = "Projection.",wordTrig=false },
    fmta("angle.l <>|<>|<> angle.r",
      { d(1, get_visual),i(2),i(3) })
  ),
  s({ trig = "bra", dscr = "Bra",wordTrig=false },
    fmta("angle.l <>|", { d(1, get_visual) })
  ),
  s({ trig = "ket", dscr = "Ket",wordTrig=false },
    fmta("|<> angle.r", { d(1, get_visual) })
  ),
  s({ trig = "comp", dscr = "Complement set",wordTrig=false },
    fmta("overline(<>)", { d(1, get_visual) })
  ),
  s({ trig = "bar", dscr = "Bar",wordTrig=false },
    fmta("macron(<>)", { d(1, get_visual) })
  ),
  s({ trig = "sla", dscr = "Slashed",wordTrig=false },
    fmta("cancel(<>)",
      { d(1, get_visual) }
    )
  ),
  s({ trig = "star", dscr = "Conjugate",wordTrig=false },
    {t("^(*)")}
  ),
  s({ trig = "empt", dscr = "Empty set.",wordTrig=false },
    {t("emptyset")}
  ),
  s({ trig = "wed", dscr = "Wedge",wordTrig=false },
    {t("and")}
  ),
  s({ trig = "inv", dscr = "Inverse.",wordTrig=false },
    {t("^(-1)")}
  ),
  s({ trig = "tr", dscr = "Transpose.",wordTrig=false },
    {t("^(T)")}
  ),
  s({ trig = "dag", dscr = "Dagger (conjugate transpose).",wordTrig=false },
    {t("^(dagger)")}
  ),
  s({ trig = "pri", dscr = "Primed Expression",wordTrig=false },
    {t("^(prime)")}
  ),
  s({trig="tens",dscr ="Tensor product.", wordTrig=false},
    {t("times.circle")}
  ),
  s({trig="cd",dscr ="Dot product.", wordTrig=false},
    {t("dot.op")}
  ),
  s({trig="coord",dscr ="Coordinates.", wordTrig=false},
    {t("x^(1),dots x^(n)")}
  ),
  s({ trig = "hbar", dscr = "Planck's constant.",wordTrig=false },
    {t("planck.reduce")}
  ),
  s({ trig = "par", dscr = "Del symbol.",wordTrig=false },
    {t("partial")}
  ),
  s({ trig = "adp", dscr = "Creation Operator of momentum p", wordTrig = false },
    fmta(
      [[
        <>^(dagger)_(arrow(<>)<>)
      ]],
      {
        i(1, "a"),
        i(2, "p"),
        i(0),
      }
    )
  ),
  s({ trig = "ap", dscr = "Annihilation Operator of momentum p", wordTrig = false },
    fmta(
      [[
        <>_(arrow(<>)<>)
      ]],
      {
        i(1, "a"),
        i(2, "p"),
        i(0),
      }
    )
  ),
  s({ trig = "xt", dscr = "arrow(x),t with editable variables", wordTrig = false },
    fmta(
      [[
        arrow(<>),<>
      ]],
      {
        i(1, "x"),
        i(2, "t"),
      }
    )
  ),
  s({ trig = "matrix(%d+)x(%d+)", regTrig = true, desc = "Typst matrix r x c "}, {
    t("mat("),
    d(1, function(_, snip)
      local r = tonumber(snip.captures[1]) or 1
      local c = tonumber(snip.captures[2]) or 1
      return matrix_dynamic({ { tostring(r)}, { tostring(c) } })
    end,{}),
    t(")"),
  }),
}
