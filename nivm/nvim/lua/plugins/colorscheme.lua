-- lua/plugins/colorscheme.lua
--
-- Cada archivo en lua/plugins/ devuelve una TABLA que describe un plugin.
-- Esto es lo mínimo que necesita lazy.nvim: el "repo/nombre" de GitHub.
--
-- Elegí catppuccin porque tu paleta (waybar/rofi/hyprland) YA ES
-- casi 1:1 el flavor "Mocha" de catppuccin:
--   - tu fondo de waybar rgba(30,30,46,0.3)  ==  base de Mocha (#1e1e2e)
--   - tu #cba6f7 (workspaces, texto)         ==  mauve de Mocha
--   - tu #f5c2e7 (accent-line del rofi)      ==  pink de Mocha
-- Solo tuve que oscurecer el "crust" para que combine con el
-- #110f18 que usas en purp.rasi.

return {
  "catppuccin/nvim",
  name = "catppuccin", -- nombre corto, catppuccin/nvim se instala como "catppuccin"
  priority = 1000, -- los colorschemes deben cargar ANTES que el resto de plugins
  opts = {
    flavour = "mocha", -- el más oscuro de los 4 flavors de catppuccin, hace juego con tu rice
    transparent_background = true, -- deja ver la transparencia de tu terminal/compositor, igual que tu waybar

    -- Aquí pisamos colores puntuales del flavor "mocha" con los tuyos
    color_overrides = {
      mocha = {
        crust = "#110f18", -- el bg-opaque exacto de tu purp.rasi
        mantle = "#17141f", -- un paso intermedio entre crust y base, mismo tono
      },
    },

    -- Integraciones: catppuccin trae temas ya hechos para otros plugins,
    -- para que no desentonen entre ellos. Los prendemos según lo que
    -- vamos a instalar más abajo.
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
