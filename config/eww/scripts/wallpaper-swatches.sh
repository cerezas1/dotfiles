#!/usr/bin/env bash

set -euo pipefail

N_COLORS="${1:-6}"

WALLPAPER=$(awww query 2>/dev/null | grep -oP '(?<=image: )\S+' | head -1 || true)

if [[ -z "$WALLPAPER" || ! -f "$WALLPAPER" ]]; then
    echo "[]"
    exit 0
fi

mapfile -t HEX_COLORS < <(
    magick "$WALLPAPER" -resize 200x200 -colors "$N_COLORS" -unique-colors txt:- \
        | grep -oE '#[0-9A-Fa-f]{6}'
)

if [[ ${#HEX_COLORS[@]} -eq 0 ]]; then
    echo "[]"
    exit 0
fi

printf '['
for i in "${!HEX_COLORS[@]}"; do
    [[ $i -gt 0 ]] && printf ','
    printf '"%s"' "${HEX_COLORS[$i]}"
done
printf ']\n'
