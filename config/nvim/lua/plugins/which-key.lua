-- lua/plugins/which-key.lua
--

return {
  "folke/which-key.nvim",
  event = "VeryLazy", -- cargar después de que todo lo demás ya inició (no es crítico para el arranque)
  opts = {
    -- Le damos nombres legibles a los grupos de atajos con prefijo <leader>f, etc
    spec = {
      { "<leader>f", group = "Buscar (telescope)" },
    },
  },
}
