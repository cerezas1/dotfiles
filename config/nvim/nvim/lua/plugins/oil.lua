-- lua/plugins/oil.lua
return {
  "stevearc/oil.nvim",
  opts = {
    view_options = {
      show_hidden = true, 
    },
  },
 
  keys = {
    { "-", "<cmd>Oil<CR>", desc = "Abrir explorador de archivos (Oil)" },
  },
}
