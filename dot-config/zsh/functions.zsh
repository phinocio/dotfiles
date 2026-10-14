spf() {
	export SPF_LAST_DIR="${XDG_STATE_HOME:-$HOME/.local/state}/superfile/lastdir"

    command spf "$@"

    [ ! -f "$SPF_LAST_DIR" ] || {
        . "$SPF_LAST_DIR"
        rm -f -- "$SPF_LAST_DIR" > /dev/null
    }
}

fcd() {
  local dir
  dir="$(fd -H --type d --max-depth 2 . "$HOME" "$LEARNING_DIR" "$NOTES_DIR" "$PROJECTS_DIR" \
         | cut -d / -f 4- | uniq \
         | fzf --preview 'eza -lagh --icons --group-directories-first --git --git-ignore --color=always "$HOME"/{} | head -n 50')"
  [[ -n $dir ]] && cd -- "$HOME/$dir"
}
