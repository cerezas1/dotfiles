#------XDG base directorios---------
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_STATE_HOME="$HOME/.local/state"

#--------------- Editor ------------------
export EDITOR="nvim"
export VISUAL="nvim"

#---------------- GPG ---------------------
export GPG_TTY=$(tty)

#---------------- PATH --------------------
# BInarios/scripts personales
export PATH="$HOME/.local/bin:$PATH"
