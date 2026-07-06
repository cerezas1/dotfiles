#!/bin/bash

# Directorio de tus fondos de pantalla
WALLPAPER_DIR="$HOME/wallpaper"

# Validar que el directorio exista
if [ ! -d "$WALLPAPER_DIR" ]; then
    mkdir -p "$WALLPAPER_DIR"
    echo "Por favor, añade imágenes en $WALLPAPER_DIR"
    exit 1
fi

shopt -s nullglob
WALLPAPERS=("$WALLPAPER_DIR"/*.{png,jpg,jpeg,gif})

# Si no hay imágenes ni gifs, salir
if [ ${#WALLPAPERS[@]} -eq 0 ]; then
    echo "No se encontraron imágenes o GIFs en $WALLPAPER_DIR"
    exit 1
fi

# Inicializar awww-daemon si no está corriendo
if ! pgrep -x "awww-daemon" > /dev/null; then
    awww-daemon &
    sleep 0.5
fi

TOTAL=${#WALLPAPERS[@]}

# Si se pasa un número directamente (ej. 1 al 9)
if [[ "$1" =~ ^[0-9]+$ ]]; then
    INDEX=$(( ($1 - 1) % TOTAL ))
    SELECTED_WALL="${WALLPAPERS[$INDEX]}"

# Si se pide el Siguiente o Anterior
elif [[ "$1" == "next" || "$1" == "prev" ]]; then
    CURRENT_WALL=$(awww query | awk '{print $NF}' | head -n 1)
    
    CURRENT_INDEX=0
    for i in "${!WALLPAPERS[@]}"; do
       if [[ "${WALLPAPERS[$i]}" == "$CURRENT_WALL" ]]; then
           CURRENT_INDEX=$i
           break
       fi
    done

    if [[ "$1" == "next" ]]; then
        INDEX=$(( (CURRENT_INDEX + 1) % TOTAL ))
    else
        INDEX=$(( (CURRENT_INDEX - 1 + TOTAL) % TOTAL ))
    fi
    SELECTED_WALL="${WALLPAPERS[$INDEX]}"
else
    echo "Uso: $0 [1-9] | next | prev"
    exit 1
fi

awww img "$SELECTED_WALL" \
    --transition-type "wave" \
    --transition-angle 30 \
    --transition-duration 1.2 \
    --transition-fps 60 \
    --resize crop
