-- :Pdf2Jpg — run pdf2img on current file's PDF (same stem as .tex)
vim.api.nvim_create_user_command('Pdf2Jpg', function()
  local path = vim.api.nvim_buf_get_name(0)
  if path == '' then
    vim.notify('No file in current buffer', vim.log.levels.ERROR)
    return
  end

  local stem = vim.fn.fnamemodify(path, ':r')   -- /path/to/diagram1
  local pdf  = stem .. '.pdf'
  local jpg  = stem .. '.jpg'

  if vim.fn.filereadable(pdf) == 0 then
    vim.notify('PDF not found: ' .. pdf, vim.log.levels.ERROR)
    return
  end

  vim.fn.jobstart({'pdf2img', pdf, 'jpg', '600'}, {
    stdout_buffered = true, stderr_buffered = true,
    on_exit = function(_, code)
      if code == 0 then
        vim.notify('Created ' .. jpg)
      else
        vim.notify('pdf2img failed — see :messages', vim.log.levels.ERROR)
      end
    end
  })
end, { desc = 'Convert current TeX’s PDF to JPG (via pdf2img)' })

-- Optional keymap
vim.keymap.set('n', '<leader>pj', ':Pdf2Jpg<CR>', { silent = true, desc = 'PDF→JPG via pdf2img' })

