-- lua/plugins/treesitter.lua
--
-- Vim "de fábrica" resalta sintaxis con expresiones regulares (regex),
-- lo cual es impreciso. Treesitter en cambio construye un árbol real
-- del código, así que el resaltado de colores es mucho más correcto
-- (por ejemplo: distingue un parámetro de función de una variable local).

return {
  "nvim-treesitter/nvim-treesitter",
  -- IMPORTANTE: nvim-treesitter reescribió su rama "main" con una API
  -- distinta (sin el módulo "nvim-treesitter.configs" que usamos abajo).
  -- Fijamos la rama "master", que es la versión "clásica" y estable,
  -- para que ensure_installed/highlight/indent sigan funcionando igual.
  branch = "master",
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
    highlight = {
      enable = true,
      -- NVIM 0.12 tiene un bug conocido con la injection de
      -- markdown_inline dentro de markdown (error "attempt to call
      -- method 'range'"). Mientras se soluciona en Neovim/treesitter,
      -- desactivamos el highlight de treesitter solo para markdown;
      -- el resaltado básico de Vim se sigue viendo bien igual.
      disable = { "markdown" },
    },
    indent = { enable = true }, -- también mejora la auto-indentación (usa el árbol, no regex)
  },
  config = function(_, opts)
    require("nvim-treesitter.configs").setup(opts)

    -- El "disable" de arriba solo afecta al highlighter que arma este
    -- plugin, pero Neovim (desde la versión 0.10+) también arranca su
    -- PROPIO motor nativo de treesitter automáticamente para ciertos
    -- filetypes (vim.treesitter.start()), completamente aparte de esta
    -- config. En NVIM 0.12 ese motor nativo choca con la injection de
    -- markdown_inline dentro de markdown. Como el "disable" de arriba
    -- no alcanza a frenar ESE mecanismo nativo, lo detenemos a mano,
    -- apenas se abre un archivo markdown.
    vim.api.nvim_create_autocmd("FileType", {
      pattern = "markdown",
      callback = function(args)
        vim.treesitter.stop(args.buf)
      end,
    })
  end,
}
