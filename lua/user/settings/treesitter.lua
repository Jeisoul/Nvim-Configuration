require("nvim-treesitter.configs").setup({
  ensure_installed = { "c", "python", "lua", "vim", "json" },
  highlight = { enable = true },
  indent = { enable = true },
})

