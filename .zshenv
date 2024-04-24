export HOSTNAME=wonderland
export VDPAU_DRIVER=nvidia
export LIBVA_DRIVER_NAME=nvidia

#export TERM='xterm-kitty'
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
export PROJECTS_WEB=$HOME/Projects/Websites
export PROJECTS_API=$HOME/Projects/APIs
export NOTES_DIR="$HOME/Documents/Notes"
export LEARNING_DIR="$HOME/Learning"

typeset -U path
path=($path ~/.local/bin)
path=($path ~/.config/composer/vendor/bin)
path=($path ~/.local/share/go/bin)

# zsh
export ZSH_CACHE_DIR=$XDG_CACHE_HOME/zsh
export ZDOTDIR=$XDG_CONFIG_HOME/zsh

# Ruby
if command -v ruby >/dev/null; then
	export GEM_HOME="$(ruby -e 'puts Gem.user_dir')"
	path=($path $GEM_HOME/bin)
fi

# OpenJDK
export _JAVA_OPTIONS=-Djava.util.prefs.userRoot="$XDG_CONFIG_HOME"/java

# Golang
export GOPATH="$XDG_DATA_HOME"/go
export GOMODCACHE="$XDG_CACHE_HOME"/go/mod

# Node/npm related
export NPM_CONFIG_USERCONFIG=$XDG_CONFIG_HOME/npm/npmrc
path=($path ~/.local/share/npm/bin)
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

# Rust/only set if cargo binary is present
export RUSTUP_HOME="$XDG_CONFIG_HOME/rustup"
export CARGO_HOME=$XDG_DATA_HOME/cargo
. "/home/alice/.local/share/cargo/env"

# Misc
export ANSIBLE_CONFIG="${XDG_CONFIG_HOME}/ansible.cfg"
export ANSIBLE_GALAXY_CACHE_DIR="${XDG_CACHE_HOME}/ansible/galaxy_cache"
export ANSIBLE_HOME="${XDG_CONFIG_HOME}/ansible"
export CUDA_CACHE_PATH=$XDG_CACHE_HOME/nv
export DOCKER_CONFIG="$XDG_CONFIG_HOME"/docker
export GNUPGHOME=$XDG_CONFIG_HOME/gnupg
export GTK2_RC_FILES=$XDG_CONFIG_HOME/gtk-2.0/gtkrc
export KUBECONFIG="$XDG_CONFIG_HOME/kube"
export LESSHISTFILE=$XDG_CACHE_HOME/lesshst
export PARALLEL_HOME="$XDG_CONFIG_HOME"/parallel
export RANGER_LOAD_DEFAULT_RC=false
export WGETRC="$XDG_CONFIG_HOME/wgetrc"
export SSH_AUTH_SOCK=$XDG_RUNTIME_DIR/gcr/ssh
export GTK_IM_MODULE=ibus
export QT_IM_MODULE=ibus
export XMODIFIERS=@im=ibus
export STARSHIP_CONFIG=$XDG_CONFIG_HOME/starship/starship.toml
