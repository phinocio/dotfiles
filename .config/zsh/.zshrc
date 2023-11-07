# Phin .zshrc file
# Last updated - 2023-10-19

# Check if the distro is arch linux
distro=$((uname -r | grep -Eq "arch") && echo "arch" || echo "n")

# Import keybinds to make del/home/end/etc work
source $ZDOTDIR/keybinds.zsh

export KEYTIMEOUT=1

# History settings
HISTFILE="$ZSH_CACHE_DIR/history.zsh"
HISTSIZE=100_000
SAVEHIST=$HISTSIZE
HISTCONTROL=ignoreboth:erasedups
HISTTIMEFORMAT="%F %T: "
setopt INC_APPEND_HISTORY
setopt EXTENDED_HISTORY
setopt HIST_IGNORE_ALL_DUPS

# Misc setopt settings
# setopt MENUCOMPLETE
setopt AUTOCD

# Completions
# autoload -Uz compinit; compinit -d $ZSH_CACHE_DIR/zcompdump-$ZSH_VERSION
# zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'
# zstyle ':completion:*' insert-unambiguous true

# Completion
autoload -Uz compinit && compinit -d $XDG_CACHE_HOME/.zcompdump-$ZSH_VERSION
zstyle ':completion:*' group-name ''
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'
zstyle ':completion:*' insert-unambiguous true
zstyle ':completion:*' menu select
_comp_options+=(globdots)
zmodload zsh/complist

# Set prompt
# autoload -U promptinit; promptinit
# prompt spaceship
eval "$(starship init zsh)"

# Source files. Good for plugins incase they break or something idk.
function zsh_source_file() {
    [ -f "$ZDOTDIR/$1" ] && source "$ZDOTDIR/$1"
}

# Plugins
function zsh_add_plugin() {
    PLUGIN_NAME=$(echo $1 | cut -d "/" -f 2)
    if [ -d "$ZDOTDIR/plugins/$PLUGIN_NAME" ]; then
        zsh_source_file "plugins/$PLUGIN_NAME/$PLUGIN_NAME.plugin.zsh" || \
        zsh_source_file "plugins/$PLUGIN_NAME/$PLUGIN_NAME.zsh"
    else
        echo "Cloning missing plugins..."
	git clone "https://github.com/$1.git" "$ZDOTDIR/plugins/$PLUGIN_NAME"
        zsh_source_file "plugins/$PLUGIN_NAME/$PLUGIN_NAME.plugin.zsh" || \
        zsh_source_file "plugins/$PLUGIN_NAME/$PLUGIN_NAME.zsh"
    fi
}

# nvm plugin
# zsh_add_plugin "lukechilds/zsh-nvm"
zsh_add_plugin "zsh-users/zsh-autosuggestions"
zsh_add_plugin "zsh-users/zsh-syntax-highlighting"
# zsh_add_plugin "zdharma-continuum/fast-syntax-highlighting"


# zsh-syntax-highlighting settings
zle_highlight=('paste:none')
(( ${+ZSH_HIGHLIGHT_STYLES} )) || typeset -A ZSH_HIGHLIGHT_STYLES
ZSH_HIGHLIGHT_STYLES[precommand]=fg=green
ZSH_HIGHLIGHT_STYLES[path]=none
# ZSH_HIGHLIGHT_STYLES[path_prefix]=none

# Aliases
if [[ "$distro" == "arch" ]]; then
    source $ZDOTDIR/aliases-arch.zsh
else
    source $ZDOTDIR/aliases-debian.zsh
fi

# Rehash bins. Move this to its own file later
zshcache_time="$(date +%s%N)"

autoload -Uz add-zsh-hook

if [[ "$distro" == "arch" ]]; then
    rehash_precmd() {
      if [[ -a /var/cache/zsh/pacman ]]; then
        local paccache_time="$(date -r /var/cache/zsh/pacman +%s%N)"
        if (( zshcache_time < paccache_time )); then
          rehash
          zshcache_time="$paccache_time"
        fi
      fi
    }
    add-zsh-hook -Uz precmd rehash_precmd
 fi

# fzf

export FZF_DEFAULT_COMMAND='fd --type f --strip-cwd-prefix'

[ -f "/usr/share/fzf/key-bindings.zsh" ] && source "/usr/share/fzf/key-bindings.zsh"
[ -f "/usr/share/fzf/completion.zsh" ] && source "/usr/share/fzf/completion.zsh"

_fzf_compgen_path() { fd --type f . "$1" } # set default path for completion
_fzf_compgen_dir() { fd --type d . "$1" }

se() { fd -tf . ~/.local/bin | fzf --preview 'bat -p --color=always {}' --bind 'enter:become(nvim {})' ;} # edit a script from .local/bin
ce() { fd -tf -H -d 2 . ~/.config | fzf --preview 'bat -p --color=always {}' --bind 'enter:become(nvim -c "set autochdir" {})' ;} # edit a config file
xo() { file=$(fd -tf . ~ | fzf) && xdg-open "$file" ;} # xdg-open a file
ed() { fd -tf . ~ |  fzf --preview 'bat -p --color=always {}' --bind 'enter:become(nvim {})' ;} # xdg-open a file

# Catppucin-macchiato
# export FZF_DEFAULT_OPTS=" \
# --color=bg+:#313244,bg:#1e1e2e,spinner:#f5e0dc,hl:#f38ba8 \
# --color=fg:#cdd6f4,header:#f38ba8,info:#cba6f7,pointer:#f5e0dc \
# --color=marker:#f5e0dc,fg+:#cdd6f4,prompt:#cba6f7,hl+:#f38ba8"

# Dracula theme
export FZF_DEFAULT_OPTS=" \
    --color=fg:#f8f8f2,hl:#bd93f9 \
    --color=fg+:#f8f8f2,bg+:#44475a,hl+:#bd93f9 \
    --color=info:#ffb86c,prompt:#50fa7b,pointer:#ff79c6 \
    --color=marker:#ff79c6,spinner:#ffb86c,header:#ff79c6"


fcd() {
	dir="$(fd -H --type d -d 2 . ~/ $NOTES_DIR $PROJECTS_DIR | cut -d / -f 4- | sort | fzf --preview 'tree -C ~/{} | head -n 50' --header 'cd to a Directory...')";
	if [[ -n $dir ]]; then
		cd $HOME/$dir
	fi
}
bindkey -s "^P" "fcd^M"

# Make use of tmux-sessionizer
bindkey -s "^F" "tmux-sessionizer^M"

note() {
	if [ $# -eq 0 ]; then
		note="$(fd --type f -d 2 . $NOTES_DIR | cut -d / -f 4- | sort | fzf --preview 'bat --color=always --style=numbers --line-range=:500 ~/{}' --header 'Open a Note...')";
		if [[ -n $note ]]; then
			nvim -c "set autochdir" $HOME/$note;
		fi
	else
		NOTE_NAME="$1";
		TIMESTAMP="$(date +%Y-%m-%d_%H:%M)";
		nvim -c "set autochdir" "${NOTES_DIR}/${TIMESTAMP}-${NOTE_NAME}.md";
	fi
}
bindkey -s "^N" "note^M"

# ALT-I - Paste the selected entry from locate output into the command line
fzf-locate-widget() {
  local selected
  if selected=$(locate / | fzf -q "$LBUFFER"); then
    LBUFFER=$selected
  fi
  zle redisplay
}

zle     -N    fzf-locate-widget
bindkey '\ei' fzf-locate-widget

eval "$(direnv hook zsh)"

# Display AN ELEPHANT on open so I don't lose terminal placement because of transparency
repo-elephant | lolcat
