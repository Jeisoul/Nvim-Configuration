-- Set leader
vim.g.mapleader = " "

-- Accented vowel remaps (if you still want them)
for _, pair in ipairs({ {'à','`a'},{'è','`e'},{'ì','`i'},{'ò','`o'},{'ù','`u'} }) do
  vim.keymap.set('n', pair[1], pair[2], { noremap = true })
end

-- Basic mappings
local map = vim.keymap.set
local opts = { noremap = true, silent = true }

map('n', '<leader>w', ':w<CR>', opts)
map('n', '<leader>y', ':%y<CR>', opts)
map('n', '<leader>q', ':q<CR>', opts)
map('n', '<leader>wq', ':wq<CR>', opts)
map('n', '<leader>c', ':bd<CR>', opts)
map('n', 'q', '<Nop>', opts)
map("n", "<leader>ff", "<cmd>Telescope find_files<CR>", { desc = "Find files" })
map('n', 'tse', '<Plug>(vimtex-env-toggle-star)', opts)

-- Buffer navigation
map('n', '<leader>bn', ':bnext<CR>', opts)
map('n', '<leader>bp', ':bprevious<CR>', opts)

-- No highlight
map('n', '<leader>h', ':noh<CR>', opts)

-- Completion sources
map('i', '<C-k>', '<C-x><C-n>', opts)
map('i', '<C-o>', '<C-x><C-o>', opts)

-- Terminal normal mode
map('t', '<C-l>', '<C-\\><C-n>', opts)

-- Custom directories
map('n', '<leader>md', ':cd /mnt/DATA/Masters<CR>', opts)
map('n', '<leader>ml', ':cd ~/.config/nvim<CR>', opts)
map('n', '<leader>me', ':cd /mnt/DATA/exercism<CR>', opts)

-- Toggle numbers
map('n', '<leader>n', ':set number!<CR>', opts)
map('n', '<leader>rn', ':set relativenumber!<CR>', opts)

-- VimTeX
map('n', '<leader>ll', ':VimtexCompile<CR>', opts)
map('n', '<leader>lk', ':VimtexStop<CR>', opts)
map('n', '<leader>lc', ':VimtexClean!<CR>', opts)
map('n', '<leader>lt', ':VimtexTocToggle<CR>', opts)
map('n', '<leader>lv', ':VimtexView<CR>', opts)

-- NvimTree (use built-in toggle/focus commands)
map('n', '<leader>e', ':NvimTreeToggle<CR>', opts)

-- ✔ Replace with:
map('n', '<leader>ft', ':ToggleTerm direction=float<CR>', { desc = "Toggle floating terminal", silent = true })

-- LuaSnip keymaps
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

-- Disable Alt-based keys
map({ 'n', 'i', 'v' }, '<M-c>', '<Nop>', opts)
map({ 'n', 'i', 'v' }, '<M-v>', '<Nop>', opts)
map({ 'n', 'i', 'v' }, '<M-Space>', '<Nop>', opts)
map({ 'n', 'i', 'v' }, '<M-t>', '<Nop>', opts)
map({ 'n', 'i', 'v' }, '<M-r>', '<Nop>', opts)

-- Diagnostic float & navigation
map("n", "gl", function()
  vim.diagnostic.open_float({ border = "rounded" })
end, { desc = "Show diagnostic under cursor" })

map("n", "[d", vim.diagnostic.goto_prev, { desc = "Previous diagnostic" })
map("n", "]d", vim.diagnostic.goto_next, { desc = "Next diagnostic" })

-- Code actions
map("n", "<leader>a", vim.lsp.buf.code_action, { desc = "Code Action" })
map("v", "<leader>a", vim.lsp.buf.code_action, { desc = "Code Action (visual)" })

-- Format buffer
map({ "n", "v" }, "<leader>fo", function()
  vim.lsp.buf.format({ async = true })
end, { desc = "Format file" })

map('n', '<leader>ff', ':Telescope find_files<CR>', opts)
map('n', '<leader>fg', ':Telescope live_grep<CR>',  opts)
map('n', '<leader>fb', ':Telescope buffers<CR>',    opts)
map('n', '<leader>fh', ':Telescope help_tags<CR>',  opts)
