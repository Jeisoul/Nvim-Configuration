--luasnip.lua
local ls = require("luasnip")
--local helpers = require("helperfunc")
--local get_visual=helpers.get_visual
local s = ls.snippet
--local sn = ls.snippet_node
local t = ls.text_node
--local i = ls.insert_node
-- local f = ls.function_node
--local d = ls.dynamic_node
-- local fmt = require("luasnip.extras.fmt").fmt
--local fmta = require("luasnip.extras.fmt").fmta
-- local rep = require("luasnip.extras").rep
return {
  s({ trig = "fboil", dscr = "Standalone TikZ-Feynman boilerplate" }, {
    t({
      "\\documentclass[tikz,border=2pt]{standalone}",
      "\\usepackage[compat=1.1.0]{tikz-feynman}",
      "\\tikzfeynmanset{",
      "  warn luatex=false,",
      "  every diagram/.style={},",
      "  /graph drawing/node distance/.code=,",
      "  /graph drawing/level distance/.code=,",
      "  /graph drawing/sibling distance/.code=,",
      "}",
      "\\begin{document}",
      "",
      "% expand your tikzpicture/feynman snippet here",
      "",
      "\\end{document}",
    }),
  }),
}
