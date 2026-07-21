# Mi Tema SDDM
## Instalación
```bash
sudo cp -r sddm-theme /usr/share/sddm/themes/kitsune/
sudoedit /etc/sddm.conf.d/theme.conf
```
Y dentro del archivo:
```ini
[Theme]
Current=kitsune

Para probar sin reiniciar sesión:
```bash
sddm-greeter --test-mode --theme /usr/share/sddm/themes/kitsune/
```
## Notas de diseño, Personalización rápida
- Colores: edita `Themes/theme.conf` (claves `accent`, `textColor`, `subTextColor`, `boxColor`, `boxBorderColor`, `inputBgColor`, `errorColor`, `placeholderColor`, `baseColor`, `overlayColor`). Todo el tema lee de ahí, no hace falta tocar los `.qml`.
- Frases de bienvenida: edita el array `frases` en `Components/Effects/FraseAnimada.qml`.
- Tamaño de la caja de login: ajusta `width`/`height` en `LoginBox.qml`.
- Importante: todas las claves de `theme.conf` deben ir dentro de `[General]`. SDDM solo expone al QML las claves de esa sección; otras secciones (como un `[Colors]` aparte) se ignoran.
