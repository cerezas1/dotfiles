-- lua/plugins/cmp.lua
--
-- nvim-cmp es el motor de autocompletado (el popup que aparece
-- mientras escribes). Por sí solo no sabe de dónde sacar sugerencias;
-- cada "source" (LSP, snippets, palabras del buffer) se agrega aparte.

return {
  "hrsh7th/nvim-cmp",
  event = "InsertEnter", -- carga solo al entrar a modo inserción, no en el arranque
  dependencies = {
    "hrsh7th/cmp-nvim-lsp", -- sugerencias que vienen del LSP
    "hrsh7th/cmp-buffer", -- sugerencias de palabras que ya aparecen en el archivo
    "hrsh7th/cmp-path", -- sugerencias de rutas de archivos
    "L3MON4D3/LuaSnip", -- motor de snippets (plantillas de código, ej: "for" + Tab)
    "saadparwaiz1/cmp_luasnip", -- conecta LuaSnip con nvim-cmp
  },
  config = function()
    local cmp = require("cmp")
    local luasnip = require("luasnip")

    cmp.setup({
      snippet = {
        expand = function(args)
          luasnip.lsp_expand(args.body)
        end,
      },
      -- Ventana minimalista, sin bordes recargados, que hereda los
      -- colores del colorscheme activo
      window = {
        completion = cmp.config.window.bordered(),
        documentation = cmp.config.window.bordered(),
      },
      mapping = cmp.mapping.preset.insert({
        ["<C-space>"] = cmp.mapping.complete(), -- forzar que aparezca el menú
        ["<C-e>"] = cmp.mapping.abort(), -- cerrar el menú sin elegir nada
        ["<CR>"] = cmp.mapping.confirm({ select = true }), -- Enter confirma la opción resaltada
        ["<Tab>"] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_next_item()
          else
            fallback()
          end
        end, { "i", "s" }),
        ["<S-Tab>"] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_prev_item()
          else
            fallback()
          end
        end, { "i", "s" }),
      }),
      -- El orden de "sources" es también el orden de prioridad
      sources = cmp.config.sources({
        { name = "nvim_lsp" },
        { name = "luasnip" },
      }, {
        { name = "buffer" },
        { name = "path" },
      }),
    })
  end,
}
