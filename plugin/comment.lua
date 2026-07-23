-- Toggle line comments at column 0 for a few filetypes
local comment_prefix = {
  lua   = "-- ",
  python= "# ",
  tex   = "% ",
  typst = "// ",
}

vim.api.nvim_create_user_command("CommentToggle", function(opts)
  local ft = vim.bo.filetype
  local prefix = comment_prefix[ft]
  if not prefix then return end

  local start_idx = opts.line1 - 1
  local end_idx   = opts.line2 - 1

  local lines = vim.api.nvim_buf_get_lines(0, start_idx, end_idx + 1, false)
  local esc = vim.pesc(prefix)

  for i, line in ipairs(lines) do
    if line:find("^" .. esc) then
      -- Remove exactly one leading prefix
      lines[i] = line:gsub("^" .. esc, "", 1)
    else
      -- Add prefix at column 0
      lines[i] = prefix .. line
    end
  end

  vim.api.nvim_buf_set_lines(0, start_idx, end_idx + 1, false, lines)
end, {
  range = true,
  desc = "Toggle a simple comment prefix at the start of line(s)",
})

-- Optional keymaps
vim.keymap.set("n", "<leader>k", "<cmd>CommentToggle<CR>", { desc = "Toggle comment current line" })
vim.keymap.set("v", "<leader>k", ":CommentToggle<CR>",      { desc = "Toggle comment selection" })
