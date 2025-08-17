vim.pack.add({
  { src = "https://github.com/stevearc/oil.nvim" },
  { src = "https://github.com/echasnovski/mini.pick" },
  { src = "https://github.com/L3MON4D3/LuaSnip" },
  { src = "https://github.com/lervag/vimtex" },
  { src = "https://github.com/nvim-treesitter/nvim-treesitter" },
  { src = "https://github.com/navarasu/onedark.nvim" },
  { src = "https://github.com/windwp/nvim-autopairs" },
  { src = "https://github.com/akinsho/bufferline.nvim" },
}, { load = true })


require("plugins.config.oil")
require("plugins.config.minipick")
require("plugins.config.luasnip")
require("plugins.config.bufferline")
require("plugins.config.treesitter")
require("plugins.config.autopairs")
require("plugins.config.vimtex")
require("plugins.config.onedark")
