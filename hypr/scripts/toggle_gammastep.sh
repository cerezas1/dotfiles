#!/bin/bash
# ~/.config/hypr/scripts/toggle_gammastep.sh

STATUS_FILE="/tmp/warm_filter_active"
SHADER_PATH="$HOME/.config/hypr/shaders/warm-filter.glsl"

if [ -f "$STATUS_FILE" ]; then
    # Apagar el shader de forma nativa pasándole una cadena vacía ""
    hyprctl keyword decoration:screen_shader ""
    rm "$STATUS_FILE"
    notify-send "Filtro de pantalla" "Filtro Desactivado" -h string:x-canonical-private-synchronous:sys-notify
else
    # Encender el shader apuntando directamente al archivo .glsl
    hyprctl keyword decoration:screen_shader "$SHADER_PATH"
    touch "$STATUS_FILE"
    notify-send "Filtro de pantalla" "Filtro Activado (Modo Cálido)" -h string:x-canonical-private-synchronous:sys-notify
fi
