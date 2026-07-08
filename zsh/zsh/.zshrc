# History

HISTFILE="$XDG_STATE_HOME/zsh/history"
HISTSIZE=100000
SAVEHIST=100000

setopt APPEND_HISTORY
setopt SHARE_HISTORY
setopt HIST_IGNORE_DUPS
setopt HIST_IGNORE_SPACE
setopt HIST_EXPIRE_DUPS_FIRST
setopt HIST_FIND_NO_DUPS

# shell

setopt AUTOCD
setopt NOBEEP
setopt NUMERIC_GLOB_SORT

# inicio de zoxide
eval "$(zoxide init zsh)"

# cargar la complementacion del systema
autoload -Uz compinit

# Iniciar complementacion con cache metadata file
compinit -d "$XDG_CACHE_HOME/zsh/zcompdump"

# Activar la complementacion de la selecion del menu interactivo
zstyle ':completion:*' menu select

# Crear complementacion
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
# Fuzzy Finder
# Arch
if [[ -f /usr/share/fzf/key-bindings.zsh ]]; then
  source /usr/share/fzf/key-bindings.zsh
  source /usr/share/fzf/completion.zsh
fi

# fzf
[[ -f "$ZDOTDIR/fzf.zsh" ]] && source "$ZDOTDIR/fzf.zsh"

for file in $ZDOTDIR/aliases/*.zsh(N); do
	source "$file"
done

for file in $ZDOTDIR/exports/*.zsh(N); do
	source "$file"
done

for file in $ZDOTDIR/funtions/*.zsh(N); do
	source "$file"
done

for file in $ZDOTDIR/plugins/*.zsh(N); do
	source "$file"
done
