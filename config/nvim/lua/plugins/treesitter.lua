-- lua/plugins/treesitter.lua
--
return {
  "nvim-treesitter/nvim-treesitter",
  branch = "master",
  lazy = false,
  build = ":TSUpdate",
  opts = {
    -- Lenguajes que se instalan automáticamente la primera vez.
    -- Agrega aquí los que uses (python, rust, go, etc).
    ensure_installed = {
      "python",
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
