export HOSTNAME=wonderland
export EDITOR='nvim'
export VISUAL=$EDITOR
export BROWSER='firefox'

# Setting XDG system directories
export XDG_DATA_DIRS=/usr/local/share:/usr/share
export XDG_CONFIG_DIRS=/etc/xdg

# Setting XDG user directories
export XDG_CONFIG_HOME=$HOME/.config
export XDG_CACHE_HOME=$HOME/.cache
export XDG_DATA_HOME=$HOME/.local/share
export XDG_STATE_HOME=$HOME/.local/state

# Custom directory envs
export PROJECTS_DIR=$HOME/Projects
export LEARNING_DIR="$HOME/Learning"
export NOTES_DIR="$HOME/Documents/Notes"

# zsh
export ZSH_CACHE_DIR=$XDG_CACHE_HOME/zsh
export ZDOTDIR=$XDG_CONFIG_HOME/zsh

# Prettier default config for prettierd
export PRETTIERD_DEFAULT_CONFIG=$XDG_CONFIG_HOME/prettier/.prettierrc.json

# Only set if bat is installed
if command -v bat >/dev/null || command -v batcat >/dev/null; then
	# Bat config
	export BAT_CONFIG_PATH="$XDG_CONFIG_HOME/bat/bat.conf"
	export BAT_THEME="Catppuccin-mocha"
	export MANPAGER="sh -c 'col -bx | bat -l man -p'"
	export MANROFFOPT="-c"
fi

typeset -U path
path=($path ~/.local/bin)
