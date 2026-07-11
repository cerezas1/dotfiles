#!/usr/bin/env bash

# Directorios
WALL_DIR="$HOME/wallpaper"
CACHE_DIR="$HOME/.cache/awww_rofi_thumbs"
ROFI_THEME="$HOME/.config/rofi/themes/Miku.rasi"

# Asegurar que existan las carpetas
mkdir -p "$CACHE_DIR"

if [ ! -d "$WALL_DIR" ]; then
    echo "La ruta de wallpapers no existe: $WALL_DIR"
    exit 1

fi

if ! command -v ffmpeg &> /dev/null && ! command -v convert &> /dev/null; then
    echo "Se recomienda instalar 'ffmpeg' o 'imagemagick' para procesar los GIFs."
fi

menu_options=""

while IFS= read -r wall; do
    wall_name=$(basename "$wall")
    extension="${wall_name##*.}"
    thumb_path="$CACHE_DIR/${wall_name%.*}.png"

    if [ "${extension,,}" = "gif" ]; then
        if [ ! -f "$thumb_path" ]; then
            if command -v ffmpeg &> /dev/null; then
                ffmpeg -i "$wall" -vframes 1 "$thumb_path" -y &>/dev/null
            elif command -v convert &> /dev/null; then
                convert "${wall}[0]" "$thumb_path" &>/dev/null
            else
                thumb_path="$wall"
            fi
        fi
    else
        thumb_path="$wall"
    fi

    menu_options+="${wall_name}\x00icon\x1f${thumb_path}\n"
done < <(find "$WALL_DIR" -type f \( -iname "*.jpg" -o -iname "*.jpeg" -o -iname "*.png" -o -iname "*.gif" \))

CHOICE=$(echo -e "$menu_options" | rofi -dmenu -theme "$ROFI_THEME" -p "Selecciona Fondo")

if [ -n "$CHOICE" ]; then
    FULL_PATH="$WALL_DIR/$CHOICE"
    awww img "$FULL_PATH"
fi
awww img "$FULL_PATH" \
      --transition-type "wave" \
      --transition-angle 45 \
      --transition-duration 1.0 \
      --transition-fps 60 \
      --resize crop
