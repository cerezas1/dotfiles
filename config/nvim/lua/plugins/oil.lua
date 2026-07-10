-- lua/plugins/oil.lua
--
-- La mayoría de configs usan nvim-tree o neo-tree: un sidebar
-- permanente a un lado con íconos, arbolito, etc. Va en contra de lo
-- "no muy llamativo" que pediste. Oil.nvim hace otra cosa: convierte
-- el directorio actual en un buffer de texto normal, editable como
-- cualquier archivo (renombras borrando texto, creas carpetas
-- escribiendo una línea nueva, etc). Cero íconos flotantes, cero sidebar.

return {
  "stevearc/oil.nvim",
  opts = {
    view_options = {
      show_hidden = true, -- útil ya que trabajas mucho con dotfiles
    },
  },
  -- "-" abre el directorio que contiene el archivo actual, al estilo netrw clásico
  keys = {
    { "-", "<cmd>Oil<CR>", desc = "Abrir explorador de archivos (Oil)" },
  },
}
