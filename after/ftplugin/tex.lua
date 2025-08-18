vim.opt_local.wrap = true
vim.opt_local.linebreak = true
vim.opt_local.breakindent = true          -- keep wrapped lines indented nicely
vim.opt_local.textwidth = 0               -- disable hard wrap
vim.opt_local.wrapmargin = 0
vim.opt_local.formatoptions:remove('t')   -- don’t auto-insert line breaks
-- (optional) avoid comment auto-wrap/join if you dislike it:
vim.opt_local.formatoptions:remove({ 'c', 'r', 'o' })
vim.opt.spell = true
vim.opt_local.breakindent = true             -- indent wrapped lines under the first
vim.opt_local.showbreak = "↳ "              -- marker for wrapped screen lines
-- Remap movement keys to move by screen lines instead of logical lines
local map = function(mode, lhs, rhs)
  vim.keymap.set(mode, lhs, rhs, { buffer = true, silent = true })
end

map("n", "j", "gj")
map("n", "k", "gk")
map("v", "j", "gj")
map("v", "k", "gk")
