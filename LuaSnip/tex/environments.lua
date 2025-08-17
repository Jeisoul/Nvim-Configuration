--luasnip.lua
local ls = require("luasnip")
local helpers = require("helperfunc")
local get_visual = helpers.get_visual
local s = ls.snippet
-- local sn = ls.snippet_node
-- local t = ls.text_node
local i = ls.insert_node
-- local f = ls.function_node
local d = ls.dynamic_node
-- local fmt = require("luasnip.extras.fmt").fmt
local fmta = require("luasnip.extras.fmt").fmta
local rep = require("luasnip.extras").rep

return {
  s({ trig = "tii", dscr = "LaTeX's textit{} command.", wordTrig=false },
    fmta("\\textit{<>}",
      { d(1, get_visual) }
    )
  ),
  s({ trig = "tbb", dscr = "LaTeX's textbf{} comand.", wordTrig=false },
    fmta("\\textbf{<>}",
      { d(1, get_visual) }
    )
  ),
  s({ trig = "matc", dscr = "LaTeX's mathcal{} comand.", wordTrig=false },
    fmta("\\mathcal{<>}",
      { d(1, get_visual) }
    )
  ),
  s({ trig = ";M", dscr = "Math Mode AUTO", snippetType="autosnippet", wordTrig=false},
    fmta("$<>$",
      { d(1, get_visual) }
    )
  ),
  s({ trig = "matb", dscr = "LaTeX's mathb environment.", wordTrig=false },
    fmta("\\mathbb{<>}",
      { d(1, get_visual) }
    )
  ),
  s({ trig = "text", dscr = "LaTeX's mathb environment.", wordTrig=false },
    fmta("\\text{<>}",
      { d(1, get_visual) }
    )
  ),
  s({ trig = "quo", dscr = "Quote.", wordTrig=false },
    fmta("``<>\'\'",
      { d(1, get_visual) }
    )
  ),
  s({ trig = "env", dscr = "Custom environment without label", wordTrig=false },
    fmta(
      [[
        \begin{<>}
          <>
        \end{<>}
      ]],
      {
        i(1),
        d(2, get_visual),
        rep(1),
      }
    )
  ),
  s({ trig = "fig", dscr = "Insert Figure" },
    fmta(
      [[
        \begin{figure}[H]
          \centering
          \includegraphics[scale=<>]{<>}
          \caption{<>}
          \label{<>}
        \end{figure}
      ]],
      {
        i(2),
        i(1),
        i(3),
        i(4)
      }
    )
  )
}
