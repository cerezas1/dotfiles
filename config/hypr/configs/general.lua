local colors = require("colors")

hl.config({
    general = {
        gaps_in = 5,
        gaps_out = 10,
        border_size = 2,
        col = {
            active_border = {
              colors = {"rgb(" .. colors.primary ..")", "rgb(" .. colors.secondary .. ")"},
              angle = 45,
      },
      inactive_border = "rgb(" .. colors.background .. ")",
    },

        resize_on_border = true,
        extend_border_grab_area = 15,
        hover_icon_on_border = true,
    },
})
