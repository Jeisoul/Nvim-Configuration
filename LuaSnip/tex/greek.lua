--luasnip.lua
local ls = require("luasnip")
-- local helpers = require("helperfunc")
-- local get_visual=helpers.get_visual
local s = ls.snippet
-- local sn = ls.snippet_node
-- local t = ls.text_node
-- local i = ls.insert_node
-- local f = ls.function_node
-- local d = ls.dynamic_node
-- local fmt = require("luasnip.extras.fmt").fmt
local fmta = require("luasnip.extras.fmt").fmta
-- local rep = require("luasnip.extras").rep


return{
  s({trig=";a",snippetType="autosnippet",wordTrig=false}, t( "\\alpha")),
  s({trig=";b",snippetType="autosnippet",wordTrig=false}, t( "\\beta")),
  s({trig=";g",snippetType="autosnippet",wordTrig=false}, t( "\\gamma")),
  s({trig=";d",snippetType="autosnippet",wordTrig=false}, t( "\\delta")),
  s({trig=";e",snippetType="autosnippet",wordTrig=false}, t( "\\varepsilon")),
  s({trig=";v",snippetType="autosnippet",wordTrig=false}, t( "\\theta")),
  s({trig=";l",snippetType="autosnippet",wordTrig=false}, t( "\\lambda")),
  s({trig=";m",snippetType="autosnippet",wordTrig=false}, t( "\\mu")),
  s({trig=";n",snippetType="autosnippet",wordTrig=false}, t( "\\nu")),
  s({trig=";x",snippetType="autosnippet",wordTrig=false}, t( "\\xi")),
  s({trig=";p",snippetType="autosnippet",wordTrig=false}, t( "\\pi")),
  s({trig=";r",snippetType="autosnippet",wordTrig=false}, t( "\\rho")),
  s({trig=";s",snippetType="autosnippet",wordTrig=false}, t( "\\sigma")),
  s({trig=";t",snippetType="autosnippet",wordTrig=false}, t( "\\tau")),
  s({trig=";f",snippetType="autosnippet",wordTrig=false}, t( "\\phi")),
  s({trig=";o",snippetType="autosnippet",wordTrig=false}, t( "\\omega")),
  s({trig=";c",snippetType="autosnippet",wordTrig=false}, t( "\\psi")),
  s({trig=";G",snippetType="autosnippet",wordTrig=false}, t( "\\Gamma")),
  s({trig=";D",snippetType="autosnippet",wordTrig=false}, t( "\\Delta")),
  s({trig=";V",snippetType="autosnippet",wordTrig=false}, t( "\\Theta")),
  s({trig=";L",snippetType="autosnippet",wordTrig=false}, t( "\\Lambda")),
  s({trig=";X",snippetType="autosnippet",wordTrig=false}, t( "\\Xi")),
  s({trig=";P",snippetType="autosnippet",wordTrig=false}, t( "\\Phi")),
  s({trig=";S",snippetType="autosnippet",wordTrig=false}, t( "\\Sigma")),
  s({trig=";F",snippetType="autosnippet",wordTrig=false}, t( "\\Phi")),
  s({trig=";O",snippetType="autosnippet",wordTrig=false}, t( "\\Omega")),
  s({trig=";C",snippetType="autosnippet",wordTrig=false}, t( "\\Psi")),
  s({trig=";i",snippetType="autosnippet",wordTrig=false}, t( "\\iota")),
  s({trig=";h",snippetType="autosnippet",wordTrig=false}, t( "\\eta")),
}

