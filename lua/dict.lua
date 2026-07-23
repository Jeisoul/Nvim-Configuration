local M = {}

-- run external command and get output + exit code
local function run(argv)
  local out = vim.fn.system(argv)
  local code = vim.v.shell_error or 0
  out = (out or ""):gsub("%s+$", "") -- trim trailing whitespace/newlines
  return out, code
end

function M.lookup(word)
  word = word or vim.fn.expand("<cword>")
  if not word or word == "" then
    vim.notify("[dict] No word under cursor", vim.log.levels.WARN)
    return
  end

  local out, code = run({ "dict", word })
  if code ~= 0 or out == "" then
    vim.notify(string.format("[dict] No result for '%s' (exit %d)", word, code or -1), vim.log.levels.INFO)
    return
  end

  -- split into lines for the preview window
  local lines = {}
  for s in (out .. "\n"):gmatch("(.-)\n") do
    table.insert(lines, s)
  end

  -- Use Neovim's LSP helper to open a robust floating window
  local util = vim.lsp.util
  local bufnr, winnr = util.open_floating_preview(
    lines,
    "markdown",
    {
      border = "rounded",
      max_width = math.min(120, math.floor(vim.o.columns * 0.8)),
      max_height = math.min(30, math.floor((vim.o.lines - vim.o.cmdheight) * 0.6)),
    }
  )

  -- close with 'q'
  vim.keymap.set("n", "q", function()
    if winnr and vim.api.nvim_win_is_valid(winnr) then
      vim.api.nvim_win_close(winnr, true)
    end
  end, { buffer = bufnr, nowait = true, silent = true, desc = "Close dictionary window" })

  -- gentle autoclose on movement/insert/leave
  local grp = vim.api.nvim_create_augroup("DictFloatClose_" .. bufnr, { clear = true })
  for _, ev in ipairs({ "CursorMoved", "CursorMovedI", "InsertEnter", "BufLeave" }) do
    vim.api.nvim_create_autocmd(ev, {
      group = grp,
      once = true,
      callback = function()
        if winnr and vim.api.nvim_win_is_valid(winnr) then
          vim.api.nvim_win_close(winnr, true)
        end
      end,
    })
  end
end

return M
