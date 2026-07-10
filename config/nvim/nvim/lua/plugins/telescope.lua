-- lua/plugins/telescope.lua
--
-- Telescope es el "Ctrl+P" / buscador difuso de Neovim: archivos,
-- texto dentro de archivos, buffers abiertos, historial de git, etc.
-- Todo se ve en un popup centrado, minimalista, que ya combina con
-- el colorscheme gracias a la integración que prendimos arriba.

return {
  "nvim-telescope/telescope.nvim",
  branch = "0.1.x",
  dependencies = {
    "nvim-lua/plenary.nvim", -- librería de funciones que telescope necesita por debajo
  },
  -- "keys" le dice a lazy.nvim: no cargues este plugin hasta que se
  -- presione una de estas teclas (carga perezosa = arranque rápido)
  keys = {
    { "<leader>ff", "<cmd>Telescope find_files<CR>", desc = "Buscar archivo" },
    { "<leader>fg", "<cmd>Telescope live_grep<CR>", desc = "Buscar texto en el proyecto" },
    { "<leader>fb", "<cmd>Telescope buffers<CR>", desc = "Buscar entre buffers abiertos" },
    { "<leader>fh", "<cmd>Telescope help_tags<CR>", desc = "Buscar en la ayuda de Neovim" },
    { "<leader>fr", "<cmd>Telescope oldfiles<CR>", desc = "Archivos recientes" },
  },
  opts = {
    defaults = {
      prompt_prefix = "  ", -- ícono minimalista en vez del ">" por defecto
      selection_caret = " ",
      sorting_strategy = "ascending", 
      layout_config = {
        prompt_position = "top",
      },
    },
  },
}
