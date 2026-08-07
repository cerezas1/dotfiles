#!/usr/bin/env bash
set -euo pipefail

DOTFILES_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
CONFIG_SRC="${DOTFILES_DIR}/config"
CONFIG_DEST="${HOME}/.config"
BACKUP_DIR="${HOME}/.dotfiles-backup/$(date +%Y%m%d-%H%M%S)"

SDDM_THEME_NAME="kitsune"
SDDM_THEME_SRC="${DOTFILES_DIR}/${SDDM_THEME_NAME}"
SDDM_THEMES_DEST="/usr/share/sddm/themes"

WALLPAPER_SRC="${DOTFILES_DIR}/wallpaper"
WALLPAPER_DEST="${HOME}/wallpaper"

ZSH_PLUGINS_DIR="${HOME}/.zsh"

PACMAN_PKGS=(
  hyprland
  waybar
  swaync
  cava
  fastfetch
  neovim
  rofi
  zsh
  kitty
  sddm
  dolphin
  playerctl
  brightnessctl
  networkmanager
  pipewire
  pipewire-pulse
  wireplumber
  awww
  jq
  fzf
  git
)

AUR_PKGS=(
  matugen-bin
)

declare -A MODULE_MAP=(
  [cava]=cava
  [ft]=fastfetch
  [hypr]=hypr
  [kitty]=kitty
  [matugen]=matugen
  [nvim]=nvim
  [rofi]=rofi
  [swaync]=swaync
  [waybar]=waybar
  [zsh]=zsh
)

ZSH_PLUGIN_REPOS=(
  "https://github.com/zsh-users/zsh-autosuggestions ${ZSH_PLUGINS_DIR}/zsh-autosuggestions"
  "https://github.com/zsh-users/zsh-syntax-highlighting ${ZSH_PLUGINS_DIR}/zsh-syntax-highlighting"
)

log() {
  echo -e "\033[1;32m==>\033[0m $1"
}

check_aur_helper() {
  if ! command -v yay &>/dev/null; then
    log "yay no encontrado, instalando..."
    sudo pacman -S --needed --noconfirm base-devel git
    git clone https://aur.archlinux.org/yay.git /tmp/yay
    (cd /tmp/yay && makepkg -si --noconfirm)
    rm -rf /tmp/yay
  fi
}

install_packages() {
  log "Instalando paquetes de pacman..."
  sudo pacman -Syu --needed --noconfirm "${PACMAN_PKGS[@]}"

  if [ "${#AUR_PKGS[@]}" -gt 0 ]; then
    check_aur_helper
    log "Instalando paquetes de AUR..."
    yay -S --needed --noconfirm "${AUR_PKGS[@]}"
  fi
}

backup_and_link() {
  local src="$1"
  local dest="$2"

  if [ -e "$dest" ] || [ -L "$dest" ]; then
    mkdir -p "$BACKUP_DIR"
    mv "$dest" "$BACKUP_DIR/"
    log "Respaldo de ${dest} guardado en ${BACKUP_DIR}"
  fi

  ln -s "$src" "$dest"
  log "Enlazado $(basename "$dest")"
}

link_config_modules() {
  mkdir -p "$CONFIG_DEST"
  for module in "${!MODULE_MAP[@]}"; do
    local src="${CONFIG_SRC}/${module}"
    local dest="${CONFIG_DEST}/${MODULE_MAP[$module]}"

    if [ ! -d "$src" ]; then
      echo "Aviso: no existe ${src}, se omite"
      continue
    fi

    backup_and_link "$src" "$dest"
  done
}

install_wallpapers() {
  if [ ! -d "$WALLPAPER_SRC" ]; then
    echo "Aviso: no existe ${WALLPAPER_SRC}, se omite"
    return
  fi

  log "Copiando wallpapers a ${WALLPAPER_DEST}..."
  mkdir -p "$WALLPAPER_DEST"
  cp -rn "$WALLPAPER_SRC"/. "$WALLPAPER_DEST"/
}

install_sddm_theme() {
  if [ ! -d "$SDDM_THEME_SRC" ]; then
    echo "Aviso: no existe ${SDDM_THEME_SRC}, se omite tema de sddm"
    return
  fi

  log "Instalando tema sddm (${SDDM_THEME_NAME})..."
  sudo mkdir -p "${SDDM_THEMES_DEST}/${SDDM_THEME_NAME}"
  sudo cp -r "$SDDM_THEME_SRC"/. "${SDDM_THEMES_DEST}/${SDDM_THEME_NAME}"/

  sudo mkdir -p /etc/sddm.conf.d
  printf '[Theme]\nCurrent=%s\n' "$SDDM_THEME_NAME" | sudo tee /etc/sddm.conf.d/theme.conf > /dev/null
}

install_zsh_plugins() {
  mkdir -p "$ZSH_PLUGINS_DIR"
  for entry in "${ZSH_PLUGIN_REPOS[@]}"; do
    local repo_url="${entry%% *}"
    local dest="${entry#* }"

    if [ -d "$dest" ]; then
      log "$(basename "$dest") ya existe, se omite"
      continue
    fi

    log "Clonando $(basename "$dest")..."
    git clone --depth 1 "$repo_url" "$dest"
  done
}

enable_services() {
  log "Habilitando sddm..."
  sudo systemctl enable sddm.service
}

set_default_shell() {
  if [ "$SHELL" != "$(command -v zsh)" ]; then
    log "Cambiando shell por defecto a zsh..."
    chsh -s "$(command -v zsh)"
  fi
}

main() {
  install_packages
  link_config_modules
  install_wallpapers
  install_sddm_theme
  install_zsh_plugins
  enable_services
  set_default_shell
  log "Listo. Reinicia sesión para aplicar los cambios."
}

main "$@"
