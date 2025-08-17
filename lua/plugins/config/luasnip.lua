require("luasnip.loaders.from_lua").load({ paths = "~/.config/nvim/LuaSnip/" })
require("luasnip").config.set_config({
  enable_autosnippets = true,
  store_selection_keys = "<Tab>",
})

