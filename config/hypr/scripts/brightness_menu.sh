#!/bin/bash
# ~/.config/hypr/scripts/brightness_menu.sh

options="󰃞 10%\n󰃟 30%\n󰃠 60%\n󰃠 100%"

chosen=$(echo -e "$options" | rofi -dmenu -p "󰃠 Brillo:" -theme ~/.config/rofi/themes/purp.rasi)

case $chosen in
    *10%) brightnessctl set 10% ;;
    *30%) brightnessctl set 30% ;;
    *60%) brightnessctl set 60% ;;
    *100%) brightnessctl set 100% ;;
esac
