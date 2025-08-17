local opt = vim.opt

-- UI
opt.number = true
opt.relativenumber = true
opt.signcolumn = "yes"
opt.termguicolors = true
opt.clipboard = "unnamedplus"
opt.undofile = true
opt.splitbelow = true
opt.splitright = true
opt.showmode = true
opt.cursorline = true
opt.cursorlineopt = "number"
opt.timeoutlen = 400
opt.mouse = ""
opt.winborder = "rounded"
opt.shortmess:append("Is")  
opt.laststatus = 3
opt.statusline = table.concat({
  "%r%h%q%w",        -- flags
  "%=",          -- separator (left/right)
  "%{&spell? 'SPELL' : ''}    ", --"SPELL" if spellcheck is on
  "%y  ",         -- filetype
})


-- Indentation
opt.expandtab = true
opt.shiftwidth = 2
opt.tabstop = 2
opt.softtabstop = 2
opt.smartindent = true
opt.autoindent = true
opt.cindent = true

-- Search
opt.ignorecase = true
opt.smartcase = true

-- Command-line completion
opt.wildignorecase = true
opt.wildmenu = true
opt.path:append("**")

-- Key Bindings
vim.g.mapleader = " "

local map = vim.keymap.set
local opts = { noremap = true, silent = true }

-- File basics
map('n', '<leader>w', ':w<CR>', opts)
map('n', '<leader>q', ':q<CR>', opts)
map('n', '<leader>wq', ':wq<CR>', opts)
map('n', '<leader>c', ':bd<CR>', opts)

-- Disable macro recording with 'q'
map('n', 'q', '<Nop>', opts)

-- Insert mode: Ctrl+L => exit insert, zt, back to insert
map("i", "<C-l>", "<Esc>zti", opts)
-- Copy entire file to system clipboard
map('n', '<leader>y', 'ggVGy', opts)

-- Buffers
map('n', '<leader>bn', ':bnext<CR>', opts)
map('n', '<leader>bp', ':bprevious<CR>', opts)

-- Highlight off
map('n', '<leader>h', ':noh<CR>', opts)

-- Terminal normal mode
map('t', '<C-l>', '<C-\\><C-n>', opts)

-- Toggle number modes
map('n', '<leader>n', ':set number!<CR>', opts)
map('n', '<leader>rn', ':set relativenumber!<CR>', opts)

-- Custom directories 
map('n', '<leader>md', ':cd /mnt/DATA/Masters<CR>', opts)
map('n', '<leader>ml', ':cd ~/.config/nvim<CR>', opts)
map('n', '<leader>me', ':cd /mnt/DATA/exercism<CR>', opts)

-- Open init.lua and shoutout
map('n', '<leader>mi', ':e ~/.config/nvim/init.lua<CR>', opts)
map('n', '<leader>so', ':w | so | echo "Config reloaded!"<CR>', opts)

-- Disable weird alt keys (optional, but may avoid accidental behavior)
map({ 'n', 'i', 'v' }, '<M-c>', '<Nop>', opts)
map({ 'n', 'i', 'v' }, '<M-v>', '<Nop>', opts)
map({ 'n', 'i', 'v' }, '<M-Space>', '<Nop>', opts)
map({ 'n', 'i', 'v' }, '<M-t>', '<Nop>', opts)
map({ 'n', 'i', 'v' }, '<M-r>', '<Nop>', opts)

-- VimTeX
map('n', '<leader>ll', ':VimtexCompile<CR>', opts)
map('n', '<leader>lk', ':VimtexStop<CR>', opts)
map('n', '<leader>lc', ':VimtexClean!<CR>', opts)
map('n', '<leader>lt', ':VimtexTocToggle<CR>', opts)
map('n', '<leader>lv', ':VimtexView<CR>', opts)
map('n', '<leader>le', ':VimtexView<CR>', opts)
map('n', '<leader>le', ':VimtexErrors<CR>', opts)
map('n', '<leader>ls', ':VimtexStatus<CR>', opts)
map('n', 'tse', '<Plug>(vimtex-env-toggle-star)', opts)

-- LuaSnip: keep if you use manual jumping
vim.cmd [[
  imap <silent><expr> <Tab> luasnip#expand_or_jumpable() ? '<Plug>luasnip-expand-or-jump' : '<Tab>'
  smap <silent><expr> <Tab> luasnip#jumpable(1) ? '<Plug>luasnip-jump-next' : '<Tab>'
  imap <silent><expr> <S-Tab> luasnip#jumpable(-1) ? '<Plug>luasnip-jump-prev' : '<S-Tab>'
  smap <silent><expr> <S-Tab> luasnip#jumpable(-1) ? '<Plug>luasnip-jump-prev' : '<S-Tab>'
]]

map({ "i", "s" }, "<C-e>", function()
  if require("luasnip").choice_active() then
    require("luasnip").change_choice(1)
  end
end, { silent = true })

-- Accented vowel mappings 
for _, pair in ipairs({ {'à','`a'},{'è','`e'},{'ì','`i'},{'ò','`o'},{'ù','`u'} }) do
  vim.keymap.set('n', pair[1], pair[2], { noremap = true })
end

-- File Navigation Stuff
map('n', '<leader>ff', ":Pick files<CR>",opts)
map('n', '<leader>fb', ":Pick buffers<CR>",opts)
map('n', '<leader>fg', ":Pick grep_live<CR>",opts)
map('n', '<leader>fh', ":Pick help<CR>",opts)
map("n", "<leader>e", function()
  require("oil").open(vim.fn.getcwd())
end, { desc = "Open Oil in current directory" })

-- Spellcheck


-- Plugins

vim.pack.add({
  -- Plugins
  { src = "https://github.com/stevearc/oil.nvim" },
  { src = "https://github.com/echasnovski/mini.pick" },
  { src = "https://github.com/L3MON4D3/LuaSnip" },
  { src = "https://github.com/lervag/vimtex" },
  { src = "https://github.com/nvim-treesitter/nvim-treesitter" },
  { src = "https://github.com/navarasu/onedark.nvim" },
  { src = "https://github.com/windwp/nvim-autopairs" },
  { src = "https://github.com/akinsho/bufferline.nvim" },
})

-- Load snippet files from your custom folder
require("luasnip.loaders.from_lua").load({ paths = "~/.config/nvim/LuaSnip/" })
require("luasnip").config.set_config({
  enable_autosnippets = true,
  store_selection_keys = "<Tab>",
})
--bufferline setup
require("bufferline").setup{
  options = {
    mode = "buffers",
    numbers = "none",
  }
}
-- Plugin setups
require("oil").setup({
  view_options = {
    show_hidden = true,
  }
})
require("mini.pick").setup()
require("nvim-treesitter.configs").setup({
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false,
  },
})
require('nvim-autopairs').setup({
    event = "InsertEnter",
    config = true,
})
vim.g.vimtex_compiler_method = 'latexmk'
vim.g.vimtex_compiler_progname = 'nvr'  -- Only if using Neovim with remote plugins
vim.g.vimtex_syntax_enabled = 1
vim.g.vimtex_imaps_enabled = 1
vim.g.vimtex_view_method = 'zathura'

vim.g.vimtex_compiler_latexmk = {
  continuous = 1,
  callback = 1,
  build_dir = '', -- Optional: 'build' to use a subdirectory
  options = {
    '-pdf',
    '-verbose',
    '-file-line-error',
    '-synctex=1',
    '-interaction=nonstopmode',
  },
}
-- UI
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
--vim.cmd(":hi statusline guibg=NONE")
local pick = require("mini.pick")

vim.keymap.set("n", "<leader>fs", function()
  local results = {}
  local files = vim.fn.glob(vim.fn.expand("~/.config/nvim/LuaSnip/tex/") .. "*.lua", false, true)

  for _, filepath in ipairs(files) do
    local file = io.open(filepath, "r")
    if file then
      local trig, dscr = nil, nil
      for line in file:lines() do
        local trig_match = line:match('trig%s*=%s*"([^"]+)"')
        local dscr_match = line:match('dscr%s*=%s*"([^"]+)"')
        if trig_match then trig = trig_match end
        if dscr_match then dscr = dscr_match end

        if trig and dscr then
          table.insert(results, trig .. " : " .. dscr)
          trig, dscr = nil, nil
        end
      end
      file:close()
    end
  end

  pick.start({
    source = {
      name = "Snippets",
      items = results,
    },
  })
end, { desc = "Search LaTeX Snippets" })
