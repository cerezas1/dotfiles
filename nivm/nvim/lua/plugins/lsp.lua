-- lua/plugins/lsp.lua
--
-- "LSP" (Language Server Protocol) es lo que le da a Neovim funciones
-- de IDE: ir a la definición de una función, ver errores mientras
-- escribes, renombrar una variable en todo el proyecto, etc.
--
-- Son TRES piezas separadas trabajando juntas:
--   mason.nvim        -> instala los servidores de lenguaje (como un gestor de paquetes propio)
--   mason-lspconfig   -> conecta mason con nvim-lspconfig
--   nvim-lspconfig    -> le dice a Neovim cómo hablar con cada servidor

return {
  {
    "williamboman/mason.nvim",
    opts = {}, -- lo dejamos con su configuración por defecto
  },
  {
    "williamboman/mason-lspconfig.nvim",
    dependencies = { "williamboman/mason.nvim" },
    opts = {
      -- Servidores que se instalan automáticamente al abrir nvim.
      -- Agrega aquí el de cada lenguaje que uses, por ejemplo:
      -- "pyright" (Python), "rust_analyzer" (Rust), "tsserver" (JS/TS), "gopls" (Go)
      ensure_installed = { "lua_ls" },
    },
  },
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "williamboman/mason-lspconfig.nvim",
      "hrsh7th/cmp-nvim-lsp", -- conecta el LSP con el autocompletado (plugins/cmp.lua)
    },
    config = function()
      -- Desde Neovim 0.11, existe una API nativa de LSP (vim.lsp.config /
      -- vim.lsp.enable). nvim-lspconfig ahora solo aporta las
      -- definiciones "de fábrica" de cada servidor; nosotros los
      -- activamos con esta API en vez del viejo
      -- require("lspconfig").xxx.setup({...}), que ya está deprecado
      -- (por eso viste ese aviso amarillo al abrir nvim).

      -- "capabilities" le avisa a cada servidor qué tan avanzado es
      -- nuestro cliente de autocompletado, para que mande mejores sugerencias
      local capabilities = require("cmp_nvim_lsp").default_capabilities()

      -- lua_ls: el servidor de Lua, útil para editar esta misma config
      vim.lsp.config("lua_ls", {
        capabilities = capabilities,
        settings = {
          Lua = {
            diagnostics = { globals = { "vim" } }, -- que no marque "vim" como variable desconocida
          },
        },
      })
      vim.lsp.enable("lua_ls")

      -- Atajos que solo se activan CUANDO hay un LSP corriendo para ese archivo
      vim.api.nvim_create_autocmd("LspAttach", {
        callback = function(event)
          local map = function(keys, fn, desc)
            vim.keymap.set("n", keys, fn, { buffer = event.buf, desc = desc })
          end

          map("gd", vim.lsp.buf.definition, "Ir a la definición")
          map("gr", vim.lsp.buf.references, "Ver referencias")
          map("K", vim.lsp.buf.hover, "Mostrar documentación")
          map("<leader>rn", vim.lsp.buf.rename, "Renombrar símbolo")
          map("<leader>ca", vim.lsp.buf.code_action, "Acciones de código")
          map("[d", vim.diagnostic.goto_prev, "Diagnóstico anterior")
          map("]d", vim.diagnostic.goto_next, "Diagnóstico siguiente")
        end,
      })

      -- Estética minimalista para los diagnósticos: sin texto flotante
      -- gigante a la derecha de cada línea, solo un signo discreto
      vim.diagnostic.config({
        virtual_text = false,
        signs = true,
        underline = true,
        severity_sort = true,
        float = { border = "rounded" },
      })
    end,
  },
}
