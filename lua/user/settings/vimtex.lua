vim.g.vimtex_compiler_method = 'latexmk'
vim.g.vimtex_compiler_progname = 'nvr'  -- Only if using Neovim with remote plugins

vim.g.vimtex_view_method = 'zathura'

vim.g.vimtex_compiler_latexmk = {
  continuous = 1,
  callback = 1,
  build_dir = '', -- Optional: 'build' to use a subdirectory
  options = {
    '-pdf',
    '-verbose',
    '-file-line-error',
    '-synctex=1',
    '-interaction=nonstopmode',
  },
}
