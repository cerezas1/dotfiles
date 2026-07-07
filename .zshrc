#=================
#Mi inicio rapido
#==================
~/.config/fastfetch/random-image.sh
#=======================================
#SISTEMA DE AUTOCOMPLETADO Y MENÚ VISUAL
#=======================================
autoload -Uz compinit && compinit -i
zstyle ':completion:*' menu select
zstyle ':completion:*' completer _complete _match _approximate
zstyle ':completion:*' list-colors '${(s.:.)LS_COLORS}'
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'
#==========
#Mis alias
#==========
alias cava="cava -p ~/.config/cava/themes/tricolor"
alias dance="chafa --watch animaciones/MIkuDance.gif"
alias ls="eza --color=always --icons=always --group-directories-first --grid"
alias ll="eza -lh --color=always --icons=always --group-directories-first --git --time-style=relative --header"
alias lt="eza --tree --level=2 --color=always --icons=always --group-directories-first"
alias ft="fastfetch"
alias cls="clear"
#????????????
#Magia negra
#????????????
source ${ZSH_CUSTOM:-~/.zsh}/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
export PATH="$HOME/.cargo/bin:$PATH"
