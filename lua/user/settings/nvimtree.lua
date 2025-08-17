vim.g.loaded_netrw=1
vim.g.loaded_netrwPlugin=1

require("nvim-tree").setup({
  sync_root_with_cwd = true,
  update_focused_file = {
    enable = true,
    update_root = false,
  },
  renderer ={
    root_folder_label=false
  },
})

