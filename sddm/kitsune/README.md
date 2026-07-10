# Mi Tema SDDM
## Instalación (Linux, típico)
```bash
sudo cp -r sddm-theme /usr/share/sddm/themes/mitema
sudo nano /etc/sddm.conf.d/theme.conf
```
Y dentro del archivo:
```ini
[Theme]
Current=mitema
Para probar sin reiniciar sesión:

```bash
sddm-greeter --test-mode --theme /usr/share/sddm/themes/mitema
```
## Notas de diseñ## Personalización rápida
- Colores: cambia los valores hexadecimales en `Components/Login/Input.qml`, `LoginBox.qml` y `PowerButtons.qml` (busca `#4e54c8`).
- Frases de bienvenida: edita el array `frases` en `Components/Effects/FraseAnimada.qml`.
- Tamaño de la caja de login: ajusta `width`/`height` en `LoginBox.qml`.
