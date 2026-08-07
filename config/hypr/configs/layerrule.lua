hl.layer_rule({
    name = "eww-music-layer",
    match = { namespace = "gtk-layer-shell" },

    blur = true,
    ignore_alpha = 1,
    animation = "slide",
})

hl.layer_rule({
    name = "swaync-control-center-blur",
    match = { namespace = "swaync-control-center" },

    vibrancy = 0.1916,
    ignore_alpha = 1,
    animation = "slide",
})

hl.layer_rule({
    name = "swaync-notification-blur",
    match = { namespace = "swaync-notification-window" },

    vibrancy = 0.1916,
    ignore_alpha = 1,
    animation = "slide",
})
