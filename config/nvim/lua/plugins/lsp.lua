return {
  {
    "williamboman/mason.nvim",
    opts = {}, -- lo dejamos con su configuración por defecto
  },
  {
    "williamboman/mason-lspconfig.nvim",
    dependencies = { "williamboman/mason.nvim" },
    opts = {
      ensure_installed = { "lua_ls" }, -- clangd viene del sistema (pacman), no de Mason

    },
  },
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "williamboman/mason-lspconfig.nvim",
      "hrsh7th/cmp-nvim-lsp", 
    },
    config = function()
      local capabilities = require("cmp_nvim_lsp").default_capabilities()

      vim.lsp.config("lua_ls", {
        capabilities = capabilities,
        settings = {
          Lua = {
            diagnostics = { globals = { "vim" } }, 
          },
        },
      })
      vim.lsp.enable("lua_ls")

      vim.lsp.config("clangd", {
        capabilities = capabilities,
        cmd = {
          "clangd",
          "--background-index",
          "--clang-tidy",
          "--header-insertion=iwyu",
          "--completion-style=detailed",
        },
      })
      vim.lsp.enable("clangd")

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
