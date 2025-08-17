vim.g.vimtex_compiler_method = 'latexmk'
vim.g.vimtex_compiler_progname = 'nvr'
vim.g.vimtex_syntax_enabled = 1
vim.g.vimtex_imaps_enabled = 1
vim.g.vimtex_view_method = 'zathura'

vim.g.vimtex_compiler_latexmk = {
  continuous = 1,
  callback = 1,
  build_dir = '',
  options = {
    '-pdf',
    '-verbose',
    '-file-line-error',
    '-synctex=1',
    '-interaction=nonstopmode',
  },
}

