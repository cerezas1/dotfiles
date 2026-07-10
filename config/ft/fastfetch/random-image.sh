#!/bin/zsh

IMG_DIR="$HOME/.config/fastfetch/logo/"

# Verifica que la carpeta exista y tenga archivos
if [ -d "$IMG_DIR" ] && [ "$(ls -A "$IMG_DIR" 2>/dev/null)" ]; then
    # Selecciona una imagen al azar (.png, .jpg, .jpeg o .webp)
    RANDOM_IMG=$(find "$IMG_DIR" -type f \( -name "*.png" -o -name "*.jpg" -o -name "*.jpeg" -o -name "*.webp" \) | shuf -n 1)
    
    # Ejecuta fastfetch con la imagen
    fastfetch --logo "$RANDOM_IMG" --logo-type auto
else
    fastfetch
fi
