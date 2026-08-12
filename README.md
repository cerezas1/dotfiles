<div align="center">

# 🏔️ dotfiles — Arch Linux + Hyprland

*Mi configuración personal de escritorio, minimalista y funcional.*

![Arch Linux](https://img.shields.io/badge/Arch%20Linux-1793D1?style=for-the-badge&logo=arch-linux&logoColor=white)
![Hyprland](https://img.shields.io/badge/Hyprland-0.55.4-58E1FF?style=for-the-badge&logo=wayland&logoColor=white)
![Stars](https://img.shields.io/github/stars/cerezas1/dotfiles?style=for-the-badge&color=yellow)

</div>

---

## 📑 Tabla de contenido

- [✨ Features](#-features)
- [🧰 Stack](#-stack)
- [📋 Requisitos previos](#-requisitos-previos)
- [🚀 Instalación](#-instalación)
- [🖼️ Capturas](#️-capturas)
- [⌨️ Keybinds](#️-keybinds)
- [🙌 Créditos](#-créditos)

## ✨ Features

- 🎨 Selector de wallpapers integrado
- 🪟 Configuración de Hyprland optimizada (tiling, gaps, animaciones)
- 🔍 Rofi como launcher principal
- 📝 Neovim configurado con explorador de archivos y búsqueda
- 🗂️ Dolphin como gestor de archivos
- ⌨️ Atajos de teclado pensados para productividad

## 🧰 Stack

| Componente        | Herramienta   |
|--------------------|--------------|
| Window Manager     | Hyprland 0.55.4 |
| Launcher           | Rofi          |
| Editor             | Neovim        |
| Gestor de archivos | Dolphin       |
| Terminal           | Kitty         |
| Barra de Estado    | Waybar        |
| Gestor de inicio   | SDDM          |
| Shell              | Zsh           |
## 📋 Requisitos previos

Antes de clonar, asegúrate de tener:

- **Arch Linux** (o derivada) recién instalado o funcional
- `git` instalado: `sudo pacman -S git`
- Drivers de GPU correctamente configurados
- Conexión a internet activa

## 🚀 Instalación
> **⚠️ Advertencia:** Se recomienda revisar el contenido de cualquier script de instalación antes de ejecutarlo en tu sistema. Asegúrate de respaldar tus configuraciones actuales antes de continuar.

### Opción 1: Clonar y ejecutar (Recomendado)
Es la opción más segura, ya que te permite revisar el script localmente antes de darle permisos de ejecución:

```bash
# 1. Clona el repositorio
git clone [https://github.com/cerezas1/dotfiles.git](https://github.com/cerezas1/dotfiles.git)
cd dotfiles
```

```bash
# 2. Asigna permisos de ejecución al script
chmod +x install.sh
```

```bash
# 3. Ejecuta el instalador
./install.sh
```

### Opcion 2: Instalación directa con un solo comando

```bash
bash -c "$(curl -fsSL [https://raw.githubusercontent.com/cerezas1/dotfiles/main/install.sh](https://raw.githubusercontent.com/cerezas1/dotfiles/main/install.sh))"
```

## 🖼️ Capturas

### Selector de Wallpapers
![Wallpaper](screenshots/wallpapers.png)

### Terminal
![Terminales](screenshots/terminal.png)

### Desktop
![Desktop](screenshots/desktop.png)

### Neovim
![Nvim](screenshots/nvim.png)

## ⌨️ Keybinds

<details>
<summary><strong>General</strong></summary>

| Acción            | Atajo          |
|:-------------------|:---------------|
| Abrir Terminal      | `Mod + W`      |
| Cerrar Ventana       | `Mod + Q`      |
| Rofi Menu            | `Mod + ESPACE`      |
| PowerMenu            | `Mod + Esc`    |
| Dolphin              | `Mod + E`      |

</details>

<details>
<summary><strong>Cambiar foco</strong></summary>

| Acción                | Atajo            |
|:------------------------|:-----------------|
| Foco a la izquierda     | `Mod + ←`         |
| Foco a la derecha        | `Mod + →`         |
| Foco hacia arriba        | `Mod + ↑`         |
| Foco hacia abajo         | `Mod + ↓`         |

</details>

<details>
<summary><strong>Workspaces</strong></summary>

| Acción                  | Atajo               |
|:--------------------------|:--------------------|
| Desplazarse entre 1-9       | `Mod + 1-9`          |
| Mover ventana a workspace   | `Mod + Shift + 1-9`  |

</details>

<details>
<summary><strong>Volumen</strong></summary>

| Acción           | Atajo   |
|:-------------------|:--------|
| Subir volumen       | `F12`   |
| Bajar volumen       | `F11`   |

</details>

<details>
<summary><strong>Wallpaper</strong></summary>

| Acción                  | Atajo       |
|:--------------------------|:------------|
| Seleccionar wallpaper       | `Mod + A`   |
| Siguiente wallpaper         | `Mod + B`   |
| Wallpaper anterior          | `Mod + N`   |

</details>

## 🙌 Créditos

Hecho con ☕ por [cerezas1](https://github.com/cerezas1).
