bindkey -v
export KEYTIMEOUT=5

typeset -g -A _zkbd
_zkbd[Home]="${terminfo[khome]}"
_zkbd[End]="${terminfo[kend]}"
_zkbd[Insert]="${terminfo[kich1]}"
_zkbd[Backspace]="${terminfo[kbs]}"
_zkbd[Delete]="${terminfo[kdch1]}"
_zkbd[Up]="${terminfo[kcuu1]}"
_zkbd[Down]="${terminfo[kcud1]}"
_zkbd[Left]="${terminfo[kcub1]}"
_zkbd[Right]="${terminfo[kcuf1]}"
_zkbd[PageUp]="${terminfo[kpp]}"
_zkbd[PageDown]="${terminfo[knp]}"
_zkbd[Shift-Tab]="${terminfo[kcbt]}"
_zkbd[Ctrl-Left]="${terminfo[kLFT5]}"
_zkbd[Ctrl-Right]="${terminfo[kRIT5]}"

[[ -n ${_zkbd[Home]}      ]] && bindkey -- "${_zkbd[Home]}"      beginning-of-line
[[ -n ${_zkbd[End]}       ]] && bindkey -- "${_zkbd[End]}"       end-of-line
[[ -n ${_zkbd[Insert]}    ]] && bindkey -- "${_zkbd[Insert]}"    overwrite-mode
[[ -n ${_zkbd[Backspace]} ]] && bindkey -- "${_zkbd[Backspace]}" backward-delete-char
[[ -n ${_zkbd[Delete]}    ]] && bindkey -- "${_zkbd[Delete]}"    delete-char
[[ -n ${_zkbd[Left]}      ]] && bindkey -- "${_zkbd[Left]}"      backward-char
[[ -n ${_zkbd[Right]}     ]] && bindkey -- "${_zkbd[Right]}"     forward-char
[[ -n ${_zkbd[PageUp]}    ]] && bindkey -- "${_zkbd[PageUp]}"    beginning-of-buffer-or-history
[[ -n ${_zkbd[PageDown]}  ]] && bindkey -- "${_zkbd[PageDown]}"  end-of-buffer-or-history
[[ -n ${_zkbd[Shift-Tab]} ]] && bindkey -- "${_zkbd[Shift-Tab]}" reverse-menu-complete
[[ -n ${_zkbd[Ctrl-Left]} ]] && bindkey -- "${_zkbd[Ctrl-Left]}" backward-word
[[ -n ${_zkbd[Ctrl-Right]} ]] && bindkey -- "${_zkbd[Ctrl-Right]}" forward-word

autoload -Uz up-line-or-beginning-search down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search
[[ -n ${_zkbd[Up]}   ]] && bindkey -- "${_zkbd[Up]}"   up-line-or-beginning-search
[[ -n ${_zkbd[Down]} ]] && bindkey -- "${_zkbd[Down]}" down-line-or-beginning-search

bindkey '^[[3;5~' kill-word              # Ctrl-Delete
bindkey '^p' history-search-backward
bindkey '^n' history-search-forward
bindkey '^y' autosuggest-accept          # requires zsh-autosuggestions
bindkey '^[y' autosuggest-accept
bindkey -s '^O' 'fcd^M'
bindkey -s '^F' 'tmux-sessionizer^M'

if (( ${+terminfo[smkx]} && ${+terminfo[rmkx]} )); then
	autoload -Uz add-zle-hook-widget
	function zle_application_mode_start { echoti smkx }
	function zle_application_mode_stop  { echoti rmkx  }
	add-zle-hook-widget -Uz zle-line-init   zle_application_mode_start
	add-zle-hook-widget -Uz zle-line-finish zle_application_mode_stop
fi

function _cursor_shape() {
  case ${KEYMAP} in
    vicmd) print -n -- '\e[2 q' ;;   # normal mode → steady block
    *)     print -n -- '\e[6 q' ;;   # insert/main → steady bar
  esac
}
zle -N zle-keymap-select _cursor_shape

function _cursor_shape_init() { print -n -- '\e[6 q' }
zle -N zle-line-init _cursor_shape_init

zle -N zle-line-finish _cursor_shape_init
