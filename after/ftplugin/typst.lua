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

-- Typst Preview
map('n', '<leader>ll', ':TypstPreview<CR>', opts)
map('n', '<leader>lk', ':TypstPreviewStop<CR>', opts)
map('n', '<leader>lt', ':TypstPreviewToggle<CR>', opts)

-- ---- Typst: compile current file to PDF (prompt for output) ----

local function typst_compile(outpath)
  if vim.bo.filetype ~= "typst" then
    vim.notify("Not a Typst buffer.", vim.log.levels.WARN)
    return
  end
  if vim.fn.executable("typst") == 0 then
    vim.notify("`typst` not found in $PATH.", vim.log.levels.ERROR)
    return
  end

  local infile = vim.fn.expand("%:p")                 -- absolute path of current .typ
  local default_out = vim.fn.expand("%:p:r") .. ".pdf"
  local outfile = outpath ~= nil and outpath or default_out

  -- Ensure .pdf extension
  if not outfile:match("%.pdf$") then
    outfile = outfile .. ".pdf"
  end

  local args = { "typst", "compile", "--root", ".", infile, outfile }
  vim.fn.jobstart(args, {
    stdout_buffered = true,
    stderr_buffered = true,
    on_stdout = function(_, data)
      if data and #data > 0 then
        vim.notify(table.concat(data, "\n"), vim.log.levels.DEBUG)
      end
    end,
    on_stderr = function(_, data)
      if data and #data > 0 then
        vim.notify(table.concat(data, "\n"), vim.log.levels.WARN)
      end
    end,
    on_exit = function(_, code)
      if code == 0 then
        vim.notify("Typst compiled → " .. outfile, vim.log.levels.INFO)
      else
        vim.notify("Typst compile failed (exit " .. code .. ")", vim.log.levels.ERROR)
      end
    end,
  })
end

local function typst_prompt_and_compile()
  local suggested = vim.fn.expand("%:t:r") .. ".pdf"  -- e.g. main.pdf
  vim.ui.input({ prompt = "Output PDF (enter for default): ", default = suggested }, function(input)
    local outpath
    if input and #input > 0 then
      -- If user typed a relative name, place it next to the .typ by default:
      if not input:match("^/") then
        outpath = vim.fn.expand("%:p:h") .. "/" .. input
      else
        outpath = input
      end
    end
    typst_compile(outpath)
  end)
end

-- Command: :TypstBuild [optional/output.pdf]
vim.api.nvim_create_user_command("TypstBuild", function(opts)
  local arg = opts.args ~= "" and opts.args or nil
  typst_compile(arg)
end, { nargs = "?" })

-- Command: :TypstBuildPrompt  (asks for a name, defaults to current)
vim.api.nvim_create_user_command("TypstBuildPrompt", function()
  typst_prompt_and_compile()
end, {})

-- Optional keymaps (buffer-local)
local function map(mode, lhs, rhs)
  vim.keymap.set(mode, lhs, rhs, { buffer = true, silent = true })
end
map("n", "<leader>lC", ":TypstBuildPrompt<CR>")  -- prompt for name, then compile
map("n", "<leader>lc", ":TypstBuild<CR>")        -- compile with default name
