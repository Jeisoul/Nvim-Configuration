local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable",
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({

  -- UI & Appearance ------------------------------------------
  {
    "sainnhe/sonokai",
    lazy = false,
    priority = 1000,
    config = function()
      require("user.settings.sonokaisettings")
    end,
  },
  -- Optional: Themes (commented out)
   --{
   --  "navarasu/onedark.nvim",
   --  name = "onedark",
   --  lazy = false,
   --  priority = 1000,
   --  config = function()
   --    require("user.settings.one")
   --  end,
   --},

  {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      require("user.settings.lualine")
    end,
  },

  -- File Navigation ------------------------------------------
  {
    "nvim-tree/nvim-tree.lua",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      require("user.settings.nvimtree")
    end,
  },

  -- Editor Enhancements --------------------------------------
  {
    "windwp/nvim-autopairs",
    event = "InsertEnter",
    config = true,
  },

  -- Snippets -------------------------------------------------
  {
    "L3MON4D3/LuaSnip",
    version = "v2.*",
    config = function()
      require("user.settings.luasnips")
    end,
  },

  -- LaTeX ----------------------------------------------------
  {
    "lervag/vimtex",
    lazy = false,
    init = function()
      require("user.settings.vimtex")
    end,
  },
  -- IDE ----------------------------------------------------

  -- LSP Config
  {
    "neovim/nvim-lspconfig",
    config = function()
      require("user.settings.lsp")
    end,
  },

  -- Autocompletion
  {
    "hrsh7th/nvim-cmp",
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
      "L3MON4D3/LuaSnip",
      "saadparwaiz1/cmp_luasnip",
    },
    config = function()
      require("user.settings.cmp")
    end,
  },

  -- Treesitter
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
      require("user.settings.treesitter")
    end,
  },

  -- Formatters and Linters
  {
    "nvimtools/none-ls.nvim",
    config = function()
      require("user.settings.null-ls")
    end,
  },

  -- Terminal
  {
    "akinsho/toggleterm.nvim",
    version = "*",
    config = function()
      require("user.settings.toggleterm")
    end,
  },

  -- Telescope
  {
    "nvim-telescope/telescope.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      require("user.settings.telescope")
    end,
  },
})
