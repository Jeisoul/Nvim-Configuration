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
local function dynamic_length(args, old_state)
  local input = args[1][1] or ""
  local length = #input
  return sn(nil, {
    t("Input length: "),
    t(tostring(length))
  })
end
local function matrix_dynamic(args, old_state)
  local rows = tonumber(args[1][1]) or 1
  local cols = tonumber(args[2][1]) or 1
  local nodes = {}

  for r = 1, rows do
    local row_nodes = {}
    for c = 1, cols do
      table.insert(row_nodes, i((r - 1) * cols + c, ""))
      if c < cols then
        table.insert(row_nodes, t(" & "))
      end
    end
    table.insert(nodes, sn(nil, row_nodes))
    if r < rows then
      table.insert(nodes, t({ " \\\\ ", "" }))
    end
  end

  return sn(nil, nodes)
end
return{
  s({ trig = "pdv", dscr = "Flexible Partial Derivative", wordTrig = false },
    fmta(
      [[
        \pdv[<>]{<>}<>
      ]],
      {
        i(1, "1"),         -- derivative order
        i(2, "f"),         -- function or expression
        c(3, {             -- optional variable
          t(""),
          sn(nil, { t("{"), i(1, "x"), t("}") })
        }),
      }
    )
  ),
  s({ trig = "dv", dscr = "Flexible Total Derivative", wordTrig = false },
    fmta(
      [[
        \dv[<>]{<>}<>
      ]],
      {
        i(1, "1"),         -- derivative order
        i(2, "f"),         -- function or expression
        c(3, {             -- optional variable
          t(""),
          sn(nil, { t("{"), i(1, "x"), t("}") })
        }),
      }
    )
  ),
  s({trig="intn",dscr ="N-D momentum integral",wordTrig=false},
    fmta(
      [[
        \int \frac{\dd^{<>}{<>}}{(2\pi)^<>}
      ]],
      {
        i(1,"3"),
        i(2,"x"),
        i(3,"3"),
      }
    )
  ),
  s({ trig = "lie", dscr = "Lie derivative",wordTrig=false },
    {t("\\mathcal{L}_")}
  ),
  s({ trig = "cov", dscr = "Covariant derivative",wordTrig=false },
    {t("\\nabla_")}
  ),
  s({trig="pow",dscr="Exponent.",wordTrig=false },
    fmta("^{<>}",
    {i(1)})
  ),
  s({trig="und",dscr="Underscore.",wordTrig=false },
    fmta("_{<>}",
    {i(1)})
  ),
  s({ trig = "set", dscr = "Set.",wordTrig=false },
    fmta("\\{<>\\}",
      { d(1, get_visual) }
    )
  ),
  s({ trig = "simp", dscr = "Oriented Simplex",wordTrig=false },
    fmta("\\langle <>\\rangle",
      { d(1, get_visual) }
    )
  ),
  s({ trig = "braket", dscr = "Bra-ket",wordTrig=false },
    fmta("\\braket{<>}{<>}",
      { d(1, get_visual),i(2) }
    )
  ),
  s({ trig = "mel", dscr = "Projection.",wordTrig=false },
    fmta("\\mel**{<>}{<>}{<>}",
      { d(1, get_visual),i(2),i(3) }
    )
  ),
  s({ trig = "bra", dscr = "Bra",wordTrig=false },
    fmta("\\bra{<>}",
      { d(1, get_visual) }
    )
  ),
  s({ trig = "ket", dscr = "Ket",wordTrig=false },
    fmta("\\ket{<>}",
      { d(1, get_visual) }
    )
  ),
  s({ trig = "comp", dscr = "Complement set",wordTrig=false },
    fmta("\\overline{<>}",
      { d(1, get_visual) }
    )
  ),
  s({ trig = "bar", dscr = "Bar",wordTrig=false },
    fmta("\\bar{<>}",
      { d(1, get_visual) }
    )
  ),
  s({ trig = "star", dscr = "Conjugate",wordTrig=false },
    {t("^{*}")}
  ),
  s({ trig = "empt", dscr = "Empty set.",wordTrig=false },
    {t("\\emptyset")}
  ),
  s({ trig = "wed", dscr = "Wedge",wordTrig=false },
    {t("\\wedge")}
  ),
  s({ trig = "inv", dscr = "Inverse.",wordTrig=false },
    {t("^{-1}")}
  ),
  s({ trig = "tr", dscr = "Transpose.",wordTrig=false },
    {t("^{T}")}
  ),
  s({ trig = "dag", dscr = "Dagger (conjugate transpose).",wordTrig=false },
    {t("^{\\dagger}")}
  ),
  s({ trig = "pri", dscr = "Primed Expression",wordTrig=false },
    {t("^{\\prime}")}
  ),
  s({ trig = "real", dscr = "Reals.",wordTrig=false },
    {t("\\mathbb{R}")}
  ),
  s({ trig = "compl", dscr = "Complex.",wordTrig=false },
    {t("\\mathbb{C}")}
  ),
  s({trig="ff",dscr ="Fraction.", wordTrig=false},
    fmta("\\frac{<>}{<>}",{i(1),i(2)})
  ),
  s({trig="int",dscr ="Integral", wordTrig=false},
    fmta("\\int_{<>}^{<>}",{i(1),i(2)})
  ),
  s({trig="tens",dscr ="Tensor product.", wordTrig=false},
    {t("\\otimes")}
  ),
  s({trig="cd",dscr ="Dot product.", wordTrig=false},
    {t("\\cdot ")}
  ),
  s({trig="coord",dscr ="Coordinates.", wordTrig=false},
    {t("x^{1},\\dots,x^{n}")}
  ),
  s({ trig = "drh", dscr = "de Rham k-th cohomology group",wordTrig=false },
    fmta("H^{k}_{\\text{dR}}(<>)",
      { d(1, get_visual) }
    )
  ),
  s({ trig = "drhb", dscr = "de Rham k-th cohomology group all k's",wordTrig=false },
    fmta("H^{\\bullet}_{\\text{dR}}(<>)",
      { d(1, get_visual) }
    )
  ),
  s({ trig = "hbar", dscr = "Planck's constant.",wordTrig=false },
    {t("\\hbar")}
  ),
  s({ trig = "par", dscr = "Del symbol.",wordTrig=false },
    {t("\\partial")}
  ),
  s({ trig = "adp", dscr = "Creation Operator of momentum p", wordTrig = false },
    fmta(
      [[
        <>^{\dagger}_{\vec{<>}\ }
      ]],
      {
        i(1, "a"),
        i(2, "p"),
      }
    )
  ),
  s({ trig = "ap", dscr = "Annihilation Operator of momentum p", wordTrig = false },
    fmta(
      [[
        <>_{\vec{<>}\ }
      ]],
      {
        i(1, "a"),
        i(2, "p"),
      }
    )
  ),
  s({ trig = "xt", dscr = "\\vec{x},t with editable variables", wordTrig = false },
    fmta(
      [[
        \vec{<>},<>
      ]],
      {
        i(1, "x"),
        i(2, "t"),
      }
    )
  ),
  s("length",{
    t("Enter text: "),
    i(1),
    t({"",""}),
    d(2, dynamic_length,{1})
  }),
  s("matrix", {
    t("\\mqty("),
    i(1,"2"),
    t(" x "),
    i(2, "2"),
    t({" ", ""}),
    d(3, matrix_dynamic, {1,2}),
    t(")")
  })
}
