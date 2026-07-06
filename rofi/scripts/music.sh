#!/bin/bash

artist=$(playerctl metadata artist 2>/dev/null)
title=$(playerctl metadata title 2>/dev/null)
status=$(playerctl status 2>/dev/null)

[ -z "$status" ] && exit 0

if [ "$status" = "Playing" ]; then
    play="󰏤  Pausar"
else
    play="󰐊  Reanudar"
fi

choice=$(printf "%s\n%s\n%s\n" \
"󰒮  Anterior" \
"$play" \
"󰒭  Siguiente" | \
rofi -dmenu \
-theme ~/.config/rofi/themes/music.rasi
-p "🎵 $artist" \
-mesg "$title")

case "$choice" in
    "󰒮  Anterior")
        playerctl previous
        ;;
    "󰏤  Pausar")
        playerctl play-pause
        ;;
    "󰐊  Reanudar")
        playerctl play-pause
        ;;
    "󰒭  Siguiente")
        playerctl next
        ;;
esac
