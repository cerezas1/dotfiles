#!/usr/bin/env bash
set -euo pipefail

WALLPAPER=$(awww query 2>/dev/null | grep -oP '(?<=image: )\S+' | head -1 || true)

if [[ -z "$WALLPAPER" || ! -f "$WALLPAPER" ]]; then
    echo '{"wallpaper":"","colors":[]}'
    exit 0
fi

declare -a HEX_COLORS=()
for i in 0 1 2 3 4; do
    hex=$(matugen image "$WALLPAPER" --source-color-index "$i" --show-colors --dry-run --quiet 2>/dev/null \
        | grep -m1 '│ source_color' \
        | grep -oE '#[0-9A-Fa-f]{6}' | head -1) || true
    [[ -z "$hex" ]] && break
    if [[ ! " ${HEX_COLORS[*]:-} " == *" $hex "* ]]; then
        HEX_COLORS+=("$hex")
    fi
done

COLORS_JSON=$(printf '%s\n' "${HEX_COLORS[@]}" | jq -R . | jq -s .)
jq -n --arg wp "$WALLPAPER" --argjson colors "$COLORS_JSON" '{wallpaper:$wp, colors:$colors}'
