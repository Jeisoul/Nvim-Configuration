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
-- dynamic builder: flat, no nested sn() per row
local function matrix_dynamic(args, old_state)
  local rows = tonumber(args[1][1]) or 1
  local cols = tonumber(args[2][1]) or 1

  local nodes = {}
  local idx = 1

  for r = 1, rows do
    for c = 1, cols do
      table.insert(nodes, i(idx, ""))  -- cell
      idx = idx + 1
      if c < cols then
        table.insert(nodes, t(" & "))
      end
    end
    if r < rows then
      -- newline in LaTeX with a real line break after it
      table.insert(nodes, t({ " \\\\ ", "" }))
    end
  end

  table.insert(nodes, i(0))  -- exit node at the end
  return sn(nil, nodes, old_state)
end

return{
 s({ trig = "pdv", dscr = "Flexible Partial Derivative", wordTrig = false },
    fmta(
      [[\pdv<>{<>}<>]],
      {
        -- choice: a literal space (to break re-trigger) OR [order]
        c(1, {
          sn(nil, { i(1, " ") }),                           -- leaves a space; safe in TeX
          sn(nil, { t("["), r(1, "ord", i(1, "1")), t("]") })
        }),
        i(2, "f"),                                          -- function/expression
        c(3, {                                              -- "" or "{x}"
          t(""),
          sn(nil, { t("{"), i(1, "x"), t("}") }),
        }),
      }
    )
  ),
 s({ trig = "dv", dscr = "Flexible Total Derivative", wordTrig = false },
    fmta(
      [[\dv<>{<>}<>]],
      {
        -- choice: a literal space (to break re-trigger) OR [order]
        c(1, {
          sn(nil, { i(1, " ") }),                           -- leaves a space; safe in TeX
          sn(nil, { t("["), r(1, "ord", i(1, "1")), t("]") })
        }),
        i(2, "f"),                                          -- function/expression
        c(3, {                                              -- "" or "{x}"
          t(""),
          sn(nil, { t("{"), i(1, "x"), t("}") }),
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
  s({ trig = "ol", dscr = "Overline.",wordTrig=false },
    fmta("\\overline{<>}",
      { d(1, get_visual) }
    )
  ),
  s({ trig = "ul", dscr = "Overline.",wordTrig=false },
    fmta("\\underline{<>}",
      { d(1, get_visual) }
    )
  ),
  s({ trig = "vec", dscr = "Vector",wordTrig=false },
    fmta("\\vec{<>}",
      { d(1, get_visual) }
    )
  ),
  s({ trig = "til", dscr = "Tilde",wordTrig=false },
    fmta("\\tilde{<>}",
      { d(1, get_visual) }
    )
  ),
  s({ trig = "dang", dscr = "Double angle Brackets",wordTrig=false },
    fmta("\\langle\\!\\langle <>\\rangle\\!\\rangle",
      { d(1, get_visual) }
    )
  ),
  s({ trig = "sla", dscr = "Slashed",wordTrig=false },
    fmta("\\slashed{<>}",
      { d(1, get_visual) }
    )
  ),
  s({ trig = "star", dscr = "Conjugate",wordTrig=false },
    {t("^{*}")}
  ),
  s({ trig = "pri", dscr = "Prime",wordTrig=false },
    {t("^{\\prime}")}
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
  s({ trig = "matrix(%d+)x(%d+)", regTrig = true, desc = "\\mqty r x c" }, {
    t("\\mqty("),
    d(1, function(_, snip)
      local r = tonumber(snip.captures[1]) or 1
      local c = tonumber(snip.captures[2]) or 1
      return matrix_dynamic({ { tostring(r) }, { tostring(c) } })
    end, {}),
    t(")"),
  }),
}
