--luasnip.lua
local ls = require("luasnip")
local helpers = require("helperfunc")
local get_visual = helpers.get_visual
local s = ls.snippet
-- local sn = ls.snippet_node
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node
local d = ls.dynamic_node
-- local fmt = require("luasnip.extras.fmt").fmt
local fmta = require("luasnip.extras.fmt").fmta
local rep = require("luasnip.extras").rep


return {
  -- 2 -> 2 with central propagator (s-channel)
 s({ trig = "fd22", dscr = "tikz-feynman 2->2 (manual coords, diagram*)" },
    fmta([[
\begin{tikzpicture}[baseline=(a.base), scale=<scale>] % 1.0|0.9|1.2
\begin{feynman}
  \vertex (i1) at (0,  1.0) {\(<in1>\)};
  \vertex (i2) at (0, -1.0) {\(<in2>\)};
  \vertex (a)  at (2.0, 0);
  \vertex (b)  at (4.0, 0);
  \vertex (f1) at (6.0,  1.0) {\(<out1>\)};
  \vertex (f2) at (6.0, -1.0) {\(<out2>\)};
  \diagram*{
    (i1) -- [fermion, momentum=\(<p1>\)] (a)
          -- [fermion, momentum=\(<p2>\)] (i2),
    (a)  -- [<med>, edge label=\(<medlbl>\)] (b), %photon | gluon | boson | charged boson | scalar
    (f1) -- [fermion, momentum'=\(<k1>\)] (b)
          -- [fermion, momentum'=\(<k2>\)] (f2),
  };
\end{feynman}
\end{tikzpicture}
]], {
      scale  = c(1, { t("1.0"), t("0.9"), t("1.2") }),
      in1    = i(2,  "e^-"),
      in2    = i(3,  "e^+"),
      out1   = i(4,  "\\mu^-"),
      out2   = i(5,  "\\mu^+"),
      p1     = i(6,  "p_1"),
      p2     = i(7,  "p_2"),
      k1     = i(8,  "k_1"),
      k2     = i(9,  "k_2"),
      med    = c(10, { t("photon"), t("gluon"), t("boson"), t("charged boson"), t("scalar") }),
      medlbl = i(11, "\\gamma"),
    })
  ),
}
