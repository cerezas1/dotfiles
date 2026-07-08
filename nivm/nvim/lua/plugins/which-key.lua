-- lua/plugins/which-key.lua
--
-- Como dijiste que no conoces mucho Lua/Vim todavía, este plugin es
-- el más "para ti" de toda la config: cada vez que presionas el
-- leader (espacio) y esperas un momento, aparece un popup mostrando
-- qué teclas puedes presionar después y qué hace cada una. Así no
-- tienes que memorizar los atajos que definimos en keymaps.lua y en
-- cada plugin (telescope, lsp, etc).

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
