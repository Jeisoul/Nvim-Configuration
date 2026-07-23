-- ~/.config/nvim/after/ftplugin/markdown.lua
vim.opt.spell = true
vim.api.nvim_buf_create_user_command(0, "MDTerm", function()
  local file = vim.api.nvim_buf_get_name(0)
  vim.cmd("vsplit | wincmd l | terminal")

  -- grab this terminal's job id
  local jid = vim.b.terminal_job_id
  if not jid then return end

  -- wait a moment for the prompt, then type the command (no <CR>)
  vim.defer_fn(function()
    vim.api.nvim_chan_send(jid, "glow " .. vim.fn.shellescape(file).."\r")
  end, 80)  -- 80–120 ms is usually enough; tweak if needed

  vim.cmd("startinsert")
end, { desc = "Split + terminal; type 'glow <file>'" })

vim.keymap.set("n", "<leader>g", "<Cmd>MDTerm<CR>", { buffer = true, silent = true })
