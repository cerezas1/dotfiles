-- Reglas de ventana
hl.window_rule({name = "firefox-custom", match = { class = "^(firefox)$" }, opaque = true, no_blur = true,})
hl.window_rule({name = "kitty-noblur", match = { class = "^(kitty)$" }, no_blur = true, })
hl.window_rule({name = "kitty-nvim-blur", match = { class = "^(kitty)$", title = ".*nvim.*" }, no_blur = true,})
hl.window_rule({
    name = "pavucontrol",
    match = { class = "^(pavucontrol|org.pulseaudio.pavucontrol|com.saivert.pwvucontrol)$" },

    opaque = true,
    no_blur = false,
    float = true,
    size = "400 420",
    center = true,
})
hl.window_rule({name = "kitty_starting_width", match = { class = "kitty" }, scrolling_width = 0.5,})
hl.workspace_rule({workspace ="2", layout_opts = {direction = "right"}, })
