require("oil").setup({
  view_options = {
    show_hidden = true,
  },
  keymaps = {
    ["gx"] = function()
      local oil = require("oil")
      local path = oil.get_cursor_entry().name
      local fullpath = oil.get_current_dir() .. path
      if path:match("%.pdf$") then
        vim.fn.jobstart({ "zathura", fullpath }, { detach = true })
      else
        vim.cmd("edit " .. fullpath)
      end
    end,
  },
})

