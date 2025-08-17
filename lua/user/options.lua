local opt = vim.opt

-- UI and behavior
opt.showmode = false
opt.cursorline = true
opt.cursorlineopt = "number"
opt.signcolumn = "yes"
opt.splitbelow = true
opt.splitright = true
opt.termguicolors = true 
opt.clipboard = "unnamedplus"
opt.timeoutlen = 400
opt.undofile = true
opt.mouse = ""
opt.fillchars = { eob = " ", vert = '┆', horiz = '┈' }

-- File search / command completion
opt.path:append("**")
opt.wildignorecase = true
opt.wildmenu = true

-- Indentation
opt.expandtab = true
opt.shiftwidth = 2
opt.smartindent = true
opt.tabstop = 2
opt.softtabstop = 2

-- Search
opt.ignorecase = true
opt.smartcase = true

-- Line numbers and ruler
opt.number = false
opt.relativenumber = true 
opt.numberwidth = 2
opt.ruler = false

-- Startup behavior
opt.shortmess:append("sI")

-- Disable unused providers for faster startup
for _, provider in ipairs({ "node", "perl", "python3", "ruby" }) do
  vim.g["loaded_" .. provider .. "_provider"] = 0
end

-- Cursor shape per mode (optional, only keep if you want it)
opt.guicursor = table.concat({
  "i-ci:ver25",
  "r-cr:hor20",
  "o:hor50",
  "sm:block",
}, ",")

-- Optional: win separator style
vim.api.nvim_set_hl(0, "WinSeparator", { fg = "#ffffff", bold = true })
