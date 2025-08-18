local opt = vim.opt

vim.g.mapleader = " "

--UI
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
opt.smoothscroll = true 
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

-- Nice UI polish
opt.fillchars = { eob = " ", vert = '┆', horiz = '┈' }

-- Provider disabling
for _, provider in ipairs({ "node", "perl", "python3", "ruby" }) do
  vim.g["loaded_" .. provider .. "_provider"] = 0
end

-- Tweak WinSeparator highlight
vim.api.nvim_set_hl(0, "WinSeparator", { fg = "#ffffff", bold = true })
