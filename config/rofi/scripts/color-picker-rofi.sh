#!/usr/bin/env bash
set -euo pipefail

DATA=$("$HOME/.config/rofi/scripts/wallpaper-swatches.sh")
WALLPAPER=$(jq -r '.wallpaper' <<<"$DATA")
mapfile -t COLORS < <(jq -r '.colors[]' <<<"$DATA")

if [[ ${#COLORS[@]} -eq 0 ]]; then
    notify-send "matugen" "No se encontraron colores en el wallpaper"
    exit 1
fi

TMPDIR=$(mktemp -d)
trap 'rm -rf "$TMPDIR"' EXIT

ROFI_INPUT=""
for i in "${!COLORS[@]}"; do
    hex="${COLORS[$i]}"
    swatch="$TMPDIR/swatch-$i.png"
    magick -size 48x48 xc:"$hex" "$swatch"
    ROFI_INPUT+="${hex}\0icon\x1f${swatch}\n"
done

CHOSEN=$(printf '%b' "$ROFI_INPUT" | rofi -dmenu -show-icons -p "Color base" -theme ~/.config/rofi/themes/purp.rasi)

[[ -z "$CHOSEN" ]] && exit 0

for i in "${!COLORS[@]}"; do 
    if [[ "${COLORS[$i]}" == "$CHOSEN" ]]; then
        matugen image "$WALLPAPER" --source-color-index "$i"
        exit 0
    fi
done
