export HOSTNAME=$(uname -n)
export EDITOR='nvim'
export VISUAL=$EDITOR
export BROWSER='firefox'

# Setting XDG system directories
export XDG_DATA_DIRS=/usr/local/share:/usr/share:~/.local/share/flatpak/exports/share/applications:/var/lib/flatpak/exports/share/applications
export XDG_CONFIG_DIRS=/etc/xdg

# Setting XDG user directories
export XDG_CONFIG_HOME=$HOME/.config
export XDG_CACHE_HOME=$HOME/.cache
export XDG_DATA_HOME=$HOME/.local/share
export XDG_STATE_HOME=$HOME/.local/state

# Custom directory envs
export PROJECTS_DIR=$HOME/Projects
export LEARNING_DIR=$HOME/Learning
export NOTES_DIR=$HOME/Notes

# zsh
export ZSH_CACHE_DIR=$XDG_CACHE_HOME/zsh
export ZDOTDIR=$XDG_CONFIG_HOME/zsh
export ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"

# Prettier default config for prettierd
export PRETTIERD_DEFAULT_CONFIG=$XDG_CONFIG_HOME/prettier/.prettierrc.json

# Only set if bat is installed
if command -v bat >/dev/null || command -v batcat >/dev/null; then
	# Bat config
	export BAT_CONFIG_PATH="$XDG_CONFIG_HOME/bat/bat.conf"
	export BAT_THEME="Catppuccin Mocha"
	export MANPAGER="sh -c 'col -bx | bat -l man -p'"
	export MANROFFOPT="-c"
fi

# Source Anthropic API Key if present
if [ -f $XDG_CONFIG_HOME/anthropic/api-key.txt ]; then
	export ANTHROPIC_API_KEY=$(cat $XDG_CONFIG_HOME/anthropic/api-key.txt)
fi

typeset -U path
path=($path ~/.local/bin)
path=($path ~/.local/share/JetBrains/Toolbox/scripts)
path=($path ~/.config/composer/vendor/bin)
path=($path ~/.cargo/bin)

export SSH_AUTH_SOCK=$XDG_RUNTIME_DIR/gcr/ssh

# Given up on keeping home clean, but go not being a dotfile is dumb
export GOPATH="$XDG_DATA_HOME"/go
export GOMODCACHE="$XDG_CACHE_HOME"/go/mod

# Android Studio
if [ "$USER" != 'alice' ]; then
    export ANDROID_HOME="$HOME/Android/Sdk"

    # Add directories to PATH if not already present
    [[ ":$PATH:" != *":$ANDROID_HOME/emulator:"* ]] && export PATH="$PATH:$ANDROID_HOME/emulator"
    [[ ":$PATH:" != *":$ANDROID_HOME/platform-tools:"* ]] && export PATH="$PATH:$ANDROID_HOME/platform-tools"
fi
