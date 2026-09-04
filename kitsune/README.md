# Kitsune – tema SDDM (Qt6)

## Estructura

```
kitsune/
├── Main.qml                 # Punto de entrada (mayúscula: lo exige sddm-greeter-qt6)
├── metadata.desktop
├── theme.conf                # Referencia de valores (ver nota abajo)
├── components/
│   ├── avatar/
│   │   ├── Avatar.qml        # Lee icon.jpg de esta misma carpeta
│   │   └── icon.jpg           # Placeholder incluido, reemplázalo por el tuyo
│   ├── Buttons/LoginButton.qml
│   ├── Login/LoginPanel.qml
│   └── Effects/
│       ├── FadeIn.qml
│       └── AnimatedPhrases.qml
├── wallpaper/                 # Coloca aquí tus imágenes (.jpg/.png/.webp)
└── scripts/
    └── randomwallpaper        # Elige un wallpaper al azar en cada login
```

### Sobre los imports con/sin versión

La documentación de Qt6 dice que la versión en los imports es
opcional (si se omite, se usa la última disponible). Sin embargo, en
`sddm-greeter-qt6` (Qt 6.11.2) esto da el error:

```
Library import requires a version
```

Es un problema conocido de algunos builds de `sddm-greeter` sobre
Qt6, que sí exigen la versión aunque el motor QML normal no la pida.
Por eso todos los `.qml` del tema usan ahora versión explícita:

```qml
import QtQuick 6.0
import QtQuick.Window 6.0
import QtQuick.Effects 1.0
```

`6.0` es la versión mínima válida en Qt6 para los módulos "clásicos"
(en Qt6 mayor y menor versión de import coinciden con la de Qt, y
`6.0` funciona igual en cualquier Qt6 posterior). 


## Wallpaper al 100% + panel con blur al 30%

- `Main.qml` pone el wallpaper a **pantalla completa** (`anchors.fill:
  parent`).
- El panel de la derecha (30% del ancho) ya **no es un rectángulo
  sólido**: usa `ShaderEffectSource` para capturar justo el recorte del
  wallpaper que queda detrás del panel, y `MultiEffect` para
  difuminarlo (blur), más un velo semitransparente (`#00000070`) encima
  para que el texto siga siendo legible.
- Puedes ajustar la intensidad del blur en `Main.qml`:
  ```qml
  MultiEffect {
      blurEnabled: true
      blur: 1.0       // 0.0 a 1.0
      blurMax: 64      // radio máximo del kernel
  }
  ```
