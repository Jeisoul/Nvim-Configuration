vim.cmd([[
  setlocal wrapmargin=10
  setlocal formatoptions+=t
  setlocal linebreak
  setlocal spell
]])
-- Remap movement keys to move by screen lines instead of logical lines
local map = function(mode, lhs, rhs)
  vim.keymap.set(mode, lhs, rhs, { buffer = true, silent = true })
end

map("n", "j", "gj")
map("n", "k", "gk")
map("v", "j", "gj")
map("v", "k", "gk")
