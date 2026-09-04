#!/bin/bash
STATE_FILE="$HOME/.cache/hyprsunset-state"
mkdir -p "$(dirname "$STATE_FILE")"

if ! pgrep -x hyprsunset > /dev/null; then
    hyprsunset --temperature 3000 &
    disown
    touch "$STATE_FILE"
    notify-send -a "hyprsunset" "Daemon iniciado" "hyprsunset no estaba corriendo, se levantó en modo cálido"
    pkill -RTMIN+8 waybar
    exit 0
fi

if [ -f "$STATE_FILE" ]; then
    hyprctl hyprsunset identity && rm -f "$STATE_FILE" && \
        notify-send -a "hyprsunset" "Filtro de luz azul" "Desactivado"
else
    hyprctl hyprsunset temperature 3000 && touch "$STATE_FILE" && \
        notify-send -a "hyprsunset" "Filtro de luz azul" "Activado"
fi

pkill -RTMIN+8 waybar
