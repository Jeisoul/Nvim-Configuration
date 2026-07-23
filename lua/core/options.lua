local opt = vim.opt

vim.g.mapleader = " "
vim.g.loaded_fzf = 1
vim.g.loaded_fzf_vim = 1
--UI
opt.number = true
opt.relativenumber = true
opt.signcolumn = "yes"
opt.termguicolors = true
opt.undofile = true
opt.splitbelow = true
opt.splitright = true
opt.showmode = true
opt.cursorline = true
opt.cursorlineopt = "number"
opt.timeoutlen = 250
opt.mouse = ""
opt.winborder = "rounded"
opt.shortmess:append("Is")  
opt.laststatus = 3
opt.smoothscroll = true 
opt.completeopt = "menu,menuone,noselect"
opt.spellfile = os.getenv("HOME") .. "/.config/nvim/spell/en.utf-8.add"
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

-- Command-line 
opt.wildignorecase = true
opt.wildoptions = "pum"
opt.wildmode = "longest:full,full"
opt.pumblend = 0
opt.inccommand = "split"
opt.wildmenu = true
opt.path:append("**")

opt.fillchars = { eob = " " }
-- Nice UI polish
-- opt.fillchars = { eob = " ", vert = '┆', horiz = '┈' }

-- Provider disabling
for _, provider in ipairs({ "node", "perl", "python3", "ruby" }) do
  vim.g["loaded_" .. provider .. "_provider"] = 0
end

-- Tweak WinSeparator highlight
vim.api.nvim_set_hl(0, "WinSeparator", { fg = "#ffffff", bold = true })

vim.g.clipboard = {
  name = "xclip",
  copy = {
    ["+"] = { "xclip", "-selection", "clipboard"},
    ["*"] = { "xclip", "-selection", "clipboard"},
  },
  paste = {
    ["+"] = { "xclip", "-selection", "clipboard", "-o" },
    ["*"] = { "xclip", "-selection", "clipboard", "-o" },
  },
  cache_enabled = 0,
}
opt.clipboard = "unnamedplus"
