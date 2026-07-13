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
- Colores: cambia los valores hexadecimales en `Components/Login/Input.qml`, `LoginBox.qml` y `PowerButtons.qml` (busca `#4e54c8`).
- Frases de bienvenida: edita el array `frases` en `Components/Effects/FraseAnimada.qml`.
- Tamaño de la caja de login: ajusta `width`/`height` en `LoginBox.qml`.
