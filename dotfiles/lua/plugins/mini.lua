-- lua/plugins/mini.lua
--
-- mini.nvim es una colección de módulos chiquitos e independientes,
-- cada uno resuelve UNA cosa sin florituras. Va perfecto con lo que
-- pediste: funcional, pero nada "llamativo" ni pesado. Usamos 3 módulos:
--   mini.statusline -> barra de estado inferior, minimalista
--   mini.pairs      -> cierra automáticamente ( [ { " ' etc
--   mini.indentscope -> una línea vertical sutil que marca el bloque de indentación actual

return {
  "echasnovski/mini.nvim",
  version = false, -- usar la versión más reciente del repo, no un release fijo
  config = function()
    -- Barra de estado: minimalista, sin "secciones" recargadas de íconos.
    -- Ya hereda los colores de catppuccin porque prendimos esa
    -- integración (integrations.mini) en plugins/colorscheme.lua
    require("mini.statusline").setup({
      use_icons = true,
    })

    -- Autocierre de paréntesis/comillas/etc, sin configuración extra necesaria
    require("mini.pairs").setup()

    -- Línea vertical sutil que marca el bloque de indentación donde
    -- está el cursor (mucho más discreta que un plugin de "rainbow indent")
    require("mini.indentscope").setup({
      draw = {
        delay = 100,
        animation = require("mini.indentscope").gen_animation.quadratic({ duration = 50 }),
      },
      symbol = "│",
    })
  end,
}
