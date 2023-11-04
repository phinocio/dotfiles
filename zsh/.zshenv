export HOSTNAME=wonderland
export VDPAU_DRIVER=nvidia
export LIBVA_DRIVER_NAME=nvidia

export TERM='xterm-kitty'
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

typeset -U path
path=($path ~/.local/bin)
path=($path ~/.config/composer/vendor/bin)

if command -v ruby >/dev/null; then
	export GEM_HOME="$(ruby -e 'puts Gem.user_dir')"
	export PATH="$PATH:$GEM_HOME/bin"
fi

# Keeping things out of $HOME.
export GTK2_RC_FILES=$XDG_CONFIG_HOME/gtk-2.0/gtkrc
export LESSHISTFILE=$XDG_CACHE_HOME/lesshst
export GNUPGHOME=$XDG_CONFIG_HOME/gnupg
export ZDOTDIR=$XDG_CONFIG_HOME/zsh
export ZSH_CACHE_DIR=$XDG_CACHE_HOME/zsh
export CUDA_CACHE_PATH=$XDG_CACHE_HOME/nv
export NPM_CONFIG_USERCONFIG=$XDG_CONFIG_HOME/npm/npmrc
export CARGO_HOME=$XDG_DATA_HOME/cargo
export PROJECTS_WEB=$HOME/Projects/Websites
export PROJECTS_API=$HOME/Projects/APIs
export _JAVA_OPTIONS=-Djava.util.prefs.userRoot="$XDG_CONFIG_HOME"/java
export WGETRC="$XDG_CONFIG_HOME/wgetrc"
export BAT_CONFIG_PATH="$XDG_CONFIG_HOME/bat/bat.conf"
export RUSTUP_HOME="$XDG_CONFIG_HOME/rustup"

if command -v bat >/dev/null || command -v batcat >/dev/null; then
	# Bat config
	export BAT_THEME="Catppuccin-mocha"
	export MANPAGER="sh -c 'col -bx | bat -l man -p'"
	export MANROFFOPT="-c"
fi

. "$XDG_DATA_HOME/cargo/env"


# nvm config
export NVM_COMPLETION=true
export NVM_LAZY_LOAD=false
export NVM_DIR=$XDG_CONFIG_HOME/nvm

# Prettier default config for prettierd
export PRETTIERD_DEFAULT_CONFIG=$XDG_CONFIG_HOME/prettier/.prettierrc.json
