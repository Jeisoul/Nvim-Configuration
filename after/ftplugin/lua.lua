vim.keymap.set('n', '<leader>so',
  ':silent update | silent! source % | echo "Config reloaded!" | redraw<CR>',
  { desc = 'Write + source current file' })


