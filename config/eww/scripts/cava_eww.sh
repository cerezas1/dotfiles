#!/usr/bin/env bash
# ~/.config/eww/scripts/cava_eww.sh
# Lee la salida cruda de cava (valores separados por ';') y la
# convierte a un array JSON por línea, que eww consume con deflisten.

cava -p "$HOME/.config/eww/cava/config" | while IFS= read -r line; do
  IFS=';' read -ra vals <<< "$line"
  json="["
  for v in "${vals[@]}"; do
    [[ -n "$v" ]] && json+="${v},"
  done
  json="${json%,}]"
  echo "$json"
done
