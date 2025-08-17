require("mini.pick").setup()
require("nvim-treesitter.configs").setup({
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false,
  },
})

