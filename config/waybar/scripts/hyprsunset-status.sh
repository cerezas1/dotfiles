#!/bin/bash
STATE_FILE="$HOME/.cache/hyprsunset-state"

if ! pgrep -x hyprsunset > /dev/null; then
    echo '{"text": "󰃞", "class": "inactive", "tooltip": "hyprsunset no está corriendo"}'
    exit 0
fi

if [ -f "$STATE_FILE" ]; then
    echo '{"text": "󰃞", "class": "active", "tooltip": "Filtro de luz azul: activado"}'
else
    echo '{"text": "󰃞", "class": "inactive", "tooltip": "Filtro de luz azul: desactivado"}'
fi
