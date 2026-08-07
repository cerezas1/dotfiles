-- Variables de Teclas
local mainMod = "SUPER"
local wallScript = "~/.config/hypr/wallpaper.sh"

-- --- Atajos del Sistema Básicos ---
hl.bind(mainMod .. " + W", hl.dsp.exec_cmd("kitty"))
hl.bind(mainMod .. " + E", hl.dsp.exec_cmd("dolphin"))
hl.bind(mainMod .. " + Q", hl.dsp.window.close())
hl.bind(mainMod .. " + V", hl.dsp.window.float({ action = "toggle" }))
hl.bind(mainMod .. " + P", hl.dsp.window.pseudo())
hl.bind(mainMod .. " + O", hl.dsp.layout("togglesplit")) -- dwindle only
hl.bind(mainMod .. " + SPACE", hl.dsp.exec_cmd("rofi -show drun -theme ~/.config/rofi/config.rasi"))
hl.bind(mainMod .. " + SHIFT + E", hl.dsp.exec_cmd("command -v hyprshutdown >/dev/null 2>&1 && hyprshutdown || hyprctl dispatch 'hl.dsp.exit()'"))
-- Cambiar de escritorio
for i = 1, 9 do
    hl.bind(mainMod .. " + " .. i, hl.dsp.focus({ workspace = i }))
end

-- Mover la ventana activa a un escritorio
for i = 1, 9 do
    hl.bind(mainMod .. " + SHIFT + " .. i, hl.dsp.window.move({ workspace = i }))
end

-- Intercambio de ventanas
hl.bind(mainMod .. " + SHIFT + H", hl.dsp.window.swap({ direction = "left" }))
hl.bind(mainMod .. " + SHIFT + J", hl.dsp.window.swap({ direction = "down" }))
hl.bind(mainMod .. " + SHIFT + K", hl.dsp.window.swap({ direction = "up" }))
hl.bind(mainMod .. " + SHIFT + L", hl.dsp.window.swap({ direction = "right" }))

-- RUTA AL SCRIPT
hl.bind("SUPER + B", hl.dsp.exec_cmd(wallScript .. " next"))
hl.bind("SUPER + N", hl.dsp.exec_cmd(wallScript .. " prev"))

-- Mover el foco entre ventanas
hl.bind(mainMod .. " + left", hl.dsp.focus({ direction = "left" }))
hl.bind(mainMod .. " + right", hl.dsp.focus({ direction = "right" }))
hl.bind(mainMod .. " + up", hl.dsp.focus({ direction = "up" }))
hl.bind(mainMod .. " + down", hl.dsp.focus({ direction = "down" }))

-- Rofi
hl.bind(mainMod .. " + Escape", hl.dsp.exec_cmd("~/.config/rofi/menus/powermenu"))
-- Rofi wallpaper
hl.bind(mainMod .. " + A", hl.dsp.exec_cmd("~/.config/rofi/menus/wallpaperselect.sh"))
-- swaync
hl.bind(mainMod .. " + S", hl.dsp.exec_cmd("swaync-client -t"))
hl.bind(mainMod .. " + D", hl.dsp.exec_cmd("swaync-client -rs"))
-- Volumen (binde = repetible mientras se mantiene presionado)
hl.bind("F12", hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%+"), { repeating = true })
hl.bind("F11", hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"), { repeating = true })
-- Mover/redimensionar con el mouse (bindm)
hl.bind(mainMod .. " + mouse:272", hl.dsp.window.drag(), { mouse = true })
hl.bind(mainMod .. " + SHIFT + mouse:273", hl.dsp.window.resize(), { mouse = true })
-- scroll
hl.bind(mainMod .. " + PERIOD", hl.dsp.layout("move +col"))
hl.bind(mainMod .. " + comma", hl.dsp.layout("move -col"))
hl.bind(mainMod .. " + SHIFT + PERIOD", hl.dsp.layout("swapcol r"))
hl.bind(mainMod .. " + SHIFT + comma", hl.dsp.layout("swapcol l"))

hl.bind(mainMod .. " + F", hl.dsp.layout("fit_into_view"))
hl.bind(mainMod .. " + SHIFT + F", hl.dsp.layout("fit expand"))
hl.bind(mainMod .. " + I", hl.dsp.layout("inhibit_scroll"))
