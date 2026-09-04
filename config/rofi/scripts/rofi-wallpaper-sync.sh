#!/usr/bin/env bash
# Actualiza ~/.config/rofi/wallpaper.rasi para que el imagebox de rofi
# muestre siempre tu wallpaper actual.
set -euo pipefail

OUT="$HOME/.config/rofi/wallpaper.rasi"

if [[ $# -ge 1 ]]; then
    # Ruta pasada como argumento (ej. desde wallpaperselect.sh, que ya la conoce)
    WALLPAPER="$1"
else
    # Sin argumento: la detectamos con awww query (mismo parseo que wallpaper-swatches.sh)
    WALLPAPER=$(awww query 2>/dev/null | grep -oP '(?<=image: )\S+' | head -1 || true)
fi

if [[ -z "$WALLPAPER" || ! -f "$WALLPAPER" ]]; then
    echo "rofi-wallpaper-sync: no pude detectar el wallpaper actual" >&2
    exit 1
fi

cat > "$OUT" <<EOF
* {
    wallpaper-image:              url("${WALLPAPER}", height);
}
EOF
