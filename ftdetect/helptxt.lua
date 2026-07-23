vim.filetype.add {
  pattern = {
    [vim.fn.stdpath("config") .. "/doc/.*%.txt"] = "help",
  },
}

