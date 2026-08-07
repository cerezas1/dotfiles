#!/bin/bash
# ~/.config/swaync/scripts/netinfo.sh

IFACE="wlan0"

INFO=$(iwctl station "$IFACE" show)

SSID=$(echo "$INFO" | grep -E '^\s*Connected network\s' | sed -E 's/^\s*Connected network\s+//; s/\s+$//')
RSSI=$(echo "$INFO" | grep -E '^\s*RSSI\s' | sed -E 's/^\s*RSSI\s+//; s/\s+$//')

if [ -z "$SSID" ]; then
  notify-send "Wi-Fi" "Sin conexión"
else
  notify-send "Wi-Fi" "Red: $SSID\nSeñal: ${RSSI:-N/A}"
fi
