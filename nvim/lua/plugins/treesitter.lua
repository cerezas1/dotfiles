-- lua/plugins/treesitter.lua
--
-- Vim "de fábrica" resalta sintaxis con expresiones regulares (regex),
-- lo cual es impreciso. Treesitter en cambio construye un árbol real
-- del código, así que el resaltado de colores es mucho más correcto
-- (por ejemplo: distingue un parámetro de función de una variable local).

return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate", -- comando que se corre después de instalar/actualizar el plugin
  event = { "BufReadPost", "BufNewFile" }, -- no cargar en el arranque, solo al abrir un archivo (arranque más rápido)
  opts = {
    -- Lenguajes que se instalan automáticamente la primera vez.
    -- Agrega aquí los que uses (python, rust, go, etc).
    ensure_installed = {
      "lua",
      "vim",
      "vimdoc",
      "bash",
      "markdown",
      "markdown_inline",
      "json",
      "yaml",
    },
    highlight = { enable = true }, -- activa el resaltado de sintaxis basado en treesitter
    indent = { enable = true }, -- también mejora la auto-indentación (usa el árbol, no regex)
  },
  config = function(_, opts)
    require("nvim-treesitter.configs").setup(opts)
  end,
}
