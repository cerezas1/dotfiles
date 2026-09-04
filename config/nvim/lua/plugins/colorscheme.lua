-- lua/plugins/colorscheme.lua
--
-- Cada archivo en lua/plugins/ devuelve una TABLA que describe un plugin.
--

return {
  "catppuccin/nvim",
  name = "catppuccin", -- nombre corto, catppuccin/nvim se instala como "catppuccin"
  priority = 1000, -- los colorschemes deben cargar ANTES que el resto de plugins
  opts = {
    flavour = "mocha", -- el más oscuro de los 4 flavors de catppuccin, hace juego con tu rice
    transparent_background = true, -- deja ver la transparencia de tu terminal/compositor

    color_overrides = {
      mocha = {
        crust = "#110f18", -- el bg-opaque exacto de tu purp.rasi
        mantle = "#17141f", -- un paso intermedio entre crust y base, mismo tono
      },
    },

    -- Integraciones: catppuccin trae temas ya hechos para otros plugins,
    integrations = {
      cmp = true,
      treesitter = true,
      telescope = { enabled = true },
      gitsigns = true,
      mini = { enabled = true },
      which_key = true,
      native_lsp = { enabled = true },
    },
  },
  config = function(_, opts)
    require("catppuccin").setup(opts)
    vim.cmd.colorscheme("catppuccin") -- lo activamos de una vez al cargar
  end,
}
