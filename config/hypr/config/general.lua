local colors = require("colors")

hl.config({
  general={
    gaps_in = 5,
    gaps_out = 10,
    border_size = 1,

    col = {
      active_border = { colors={"rgba(" .. colors.primary .. "d9)", "rgba(" .. colors.secondary .. "d9)"}, angle = 45},
      inactive_border = "rgba(" .. colors.background .. "99)",
    },
    resize_on_border = true,
    allow_tearing = true,
    layout = "dwindle",
    hover_icon_on_border = true,
  },
  decoration = {
    rounding  = 20,
    rounding_power = 2,
    active_opacity = 0.90,
    inactive_opacity = 0.85,

    shadow = {
      enabled = false,
    },

    blur = {
      enabled = true,
      size    = 2,
      new_optimizations = true,
      passes  =3,
      xray =true,
--      vibrancy  = 0.1696,
    },
  },

  animations = {
    enabled = true,
  },
})
