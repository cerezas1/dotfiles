# --- Git: cambiar de branch con fzf ---
fbr() {
  local branch
  branch=$(git branch --all | grep -v HEAD | sed 's/.* //; s#remotes/[^/]*/##' | sort -u \
    | fzf --preview 'git log --oneline --graph --color=always {} | head -50')
  [[ -n "$branch" ]] && git checkout "$branch"
}

# --- Git: explorar commits y ver el diff ---
flog() {
  git log --color=always --oneline \
    | fzf --ansi --preview 'git show --color=always {1}' \
          --bind 'enter:execute(git show {1} | less -R)'
}

# --- Procesos: matar uno seleccionándolo ---
fkill() {
  local pid
  pid=$(ps -ef | sed 1d | fzf -m --header='Selecciona proceso(s) a matar' | awk '{print $2}')
  [[ -n "$pid" ]] && echo "$pid" | xargs kill -9
}

# --- Editar archivo con preview (usa tu $EDITOR) ---
fe() {
  local file
  file=$(eval "$FZF_DEFAULT_COMMAND" | fzf --preview "$_FZF_PREVIEW_CMD")
  [[ -n "$file" ]] && ${EDITOR:-vim} "$file"
}

# --- cd a directorio reciente (combina zoxide + fzf) ---
fcd() {
  local dir
  dir=$(zoxide query -l | fzf --preview 'ls -la --color=always {}') \
    && cd "$dir"
}

# --- Buscar contenido en archivos con ripgrep + preview ---
frg() {
  local file line
  read -r file line <<< "$(rg --line-number --no-heading --color=always . \
    | fzf --ansi --delimiter ':' \
          --preview 'bat --color=always --highlight-line {2} {1}' \
    | awk -F: '{print $1, $2}')"
  [[ -n "$file" ]] && ${EDITOR:-vim} "+$line" "$file"
}
