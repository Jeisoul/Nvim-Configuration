local map = vim.keymap.set
local opts = { noremap = true, silent = true }

-- File basics
map('n', '<leader>w', ':w<CR>', opts)
map('n', '<leader>q', ':q<CR>', opts)
map('n', '<leader>wq', ':wq<CR>', opts)
map('n', '<leader>c', ':bd<CR>', opts)

-- Disable macro recording with 'q'
map('n', 'q', '<Nop>', opts)

-- Put the *display* (wrapped) line with the cursor at the very top.
map("i", "<C-l>", function()
  -- leave insert
  vim.api.nvim_feedkeys("","i",false)

  local r = vim.fn.winline()        -- cursor's current screen row (1 = top)
  if r > 1 then
    -- scroll window down r-1 lines so the cursor's screen row becomes 1
    vim.cmd("normal! " .. (r - 1) .. "")
  end

  -- back to insert
  vim.api.nvim_feedkeys("a", "n", false)
end, opts)
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
map('n', '<leader>mt', ':cd /mnt/DATA/Notas<CR>', opts)

-- Open init.lua and shoutout
map('n', '<leader>mi', ':e ~/.config/nvim/init.lua<CR>', opts)
-- Disable weird alt keys (optional, but may avoid accidental behavior)
map({ 'n', 'i', 'v' }, '<M-c>', '<Nop>', opts)
map({ 'n', 'i', 'v' }, '<M-v>', '<Nop>', opts)
map({ 'n', 'i', 'v' }, '<M-Space>', '<Nop>', opts)
map({ 'n', 'i', 'v' }, '<M-t>', '<Nop>', opts)
map({ 'n', 'i', 'v' }, '<M-r>', '<Nop>', opts)

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
map("n", "yp", function()
  local oil = require("oil")
  local entry = oil.get_cursor_entry()
  local path = vim.fs.joinpath(oil.get_current_dir(), entry.name)
  vim.fn.setreg("+",path)
end, opts, { desc = "Copy Oil entry under cursor to system clipboard" })

--Search Snippets
local pick = require("mini.pick")
map("n", "<leader>sl", function()
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
      name = "LaTeX Snippets",
      items = results,
    },
  })
end, { desc = "Search LaTeX Snippets" })
map("n", "<leader>st", function()
  local results = {}
  local files = vim.fn.glob(vim.fn.expand("~/.config/nvim/LuaSnip/typst/") .. "*.lua", false, true)

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
      name = "Typst Snippets",
      items = results,
    },
  })
end, { desc = "Search Typst Snippets" })

-- Dictionary integration
local ok, dict = pcall(require, "dict")
if ok then
  -- :Dict [word]  (default: word under cursor)
  vim.api.nvim_create_user_command("Dict", function(opts)
    dict.lookup(opts.args ~= "" and opts.args or nil)
  end, { nargs = "?", desc = "Show dictionary definition in a float" })

  -- Press K to show a definition in text/markdown/help buffers
  -- (keeps your K for LSP in code files)
  local dict_ft = { "markdown", "text", "typst", "help" }
  vim.api.nvim_create_autocmd("FileType", {
    pattern = dict_ft,
    callback = function()
      vim.keymap.set({"n","v"}, "K", function() dict.lookup() end,
        { buffer = true, silent = true, desc = "Dictionary lookup" })
    end,
  })

  -- Optional: global mapping on <leader>d
  vim.keymap.set({"n", "v"}, "<leader>d", function() dict.lookup() end,
    { silent = true, desc = "Dictionary lookup" })
end
