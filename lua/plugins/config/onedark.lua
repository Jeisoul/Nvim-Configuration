require('onedark').setup {
    style = 'deep',
    transparent = true,
}
require('onedark').load()

vim.api.nvim_create_autocmd("ColorScheme", {
  pattern = "*",
  callback = function()
    local hl = vim.api.nvim_set_hl
    hl(0, "texStatement",      { link = "Keyword" })
    hl(0, "texSection",        { link = "Title" })
    hl(0, "texMathZone",       { link = "Special" })
    hl(0, "texCmd",            { fg = "#a21caf", italic = true })
    hl(0, "texMathZoneEnv",    { fg = "#f9e2af", italic = true })
    hl(0, "texMathEnvArgName", { fg = "#fab387", italic = true })
    hl(0, "texMathDelimZoneTI", { fg = "#ffffff"})
    hl(0, "texDelim",          { fg = "#7f8c8d"})

  end,
})
vim.cmd.colorscheme("onedark")

