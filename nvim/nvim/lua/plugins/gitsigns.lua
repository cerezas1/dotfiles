-- lua/plugins/gitsigns.lua
--
-- Muestra en la columna de signos (la que activamos en options.lua)
-- una marca discreta por cada línea agregada/modificada/borrada
-- respecto al último commit. Nada de ventanas ni popups, solo esos signos.

return {
  "lewis6991/gitsigns.nvim",
  event = { "BufReadPre", "BufNewFile" },
  opts = {
    signs = {
      add = { text = "│" },
      change = { text = "│" },
      delete = { text = "_" },
      topdelete = { text = "‾" },
      changedelete = { text = "~" },
    },
  },
}
