#!/usr/bin/env bash

set -euo pipefail

SWATCHES=$("$HOME/.config/eww/scripts/wallpaper-swatches.sh")
eww update wallpaper_swatches="$SWATCHES"
eww open --toggle color_picker_popup
