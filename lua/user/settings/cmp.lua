local cmp = require("cmp")

cmp.setup({
  snippet = {
    expand = function(args)
      require("luasnip").lsp_expand(args.body)
    end,
  },
  mapping = cmp.mapping.preset.insert({
    ["<C-f>"] = cmp.mapping.scroll_docs(4),
    ["<C-b>"] = cmp.mapping.scroll_docs(-4),
  }),
  sources = {
    { name = "nvim_lsp" },
    { name = "luasnip" },
  },
  completion = {
    keyword_length = 1,
    completeopt = "menu,menuone,noselect",
  },
  performance = {
    max_view_entries = 5, -- Limit number of items in completion menu
  },
})
