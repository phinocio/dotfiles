source $ZDOTDIR/functions.zsh

####################################
#
# PROMPT CONFIG
#
####################################

eval "$(starship init zsh)"

####################################
#
# HISTORY CONFIG
#
####################################

HISTSIZE=100_000
HISTFILE="$ZSH_CACHE_DIR/history.zsh"
SAVEHIST=$HISTSIZE
HISTTIMEFORMAT="%F %T: "
HISTDUP=erase
setopt appendhistory
setopt sharehistory
setopt extended_history
setopt hist_ignore_space
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_find_no_dups

####################################
#
# PLUGINS CONFIG
#
####################################

# Install zinit if it doesn't already exist, then source it.
[ ! -d $ZINIT_HOME ] && mkdir -p "$(dirname $ZINIT_HOME)"
[ ! -d $ZINIT_HOME/.git ] && git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"

declare -A ZINIT
export ZINIT[NO_ALIASES]='1'
export ZINIT[ZCOMPDUMP_PATH]="$XDG_CACHE_HOME/.zcompdump-$ZSH_VERSION"
source "${ZINIT_HOME}/zinit.zsh"

setopt noaliases

# Plugins
zinit light Aloxaf/fzf-tab
zinit light zsh-users/zsh-syntax-highlighting
zinit light zsh-users/zsh-completions
zinit light zsh-users/zsh-autosuggestions

# zsh-syntax-highlighting settings
# Specifically, remove underline
zle_highlight=('paste:none')
(( ${+ZSH_HIGHLIGHT_STYLES} )) || typeset -A ZSH_HIGHLIGHT_STYLES
ZSH_HIGHLIGHT_STYLES[precommand]=fg=green
ZSH_HIGHLIGHT_STYLES[path]=none
# ZSH_HIGHLIGHT_STYLES[path_prefix]=none

####################################
#
# COMPLETTIONS CONFIG
#
####################################

autoload -Uz compinit && compinit -d $XDG_CACHE_HOME/.zcompdump-$ZSH_VERSION
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
zstyle ':completion:*' menu no
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'eza -a --color=always $realpath'
zstyle ':fzf-tab:complete:__zoxide_z:*' fzf-preview 'eza -a --color=always $realpath'

zinit cdreplay -q

####################################
#
# KEYBINDS CONFIG
#
####################################

# Source some defaults from Arch Wiki
source $ZDOTDIR/keybinds.zsh

bindkey '^H' backward-kill-word
bindkey '^[[3;5~' kill-word

bindkey '^p' history-search-backward
bindkey '^n' history-search-forward

# Accept zsh-autosuggestion with ctrl+y
bindkey '^y' autosuggest-accept
bindkey '^[y' autosuggest-accept

# Move to beginning or end of words
key[Control-Left]="${terminfo[kLFT5]}"
key[Control-Right]="${terminfo[kRIT5]}"
[[ -n "${key[Control-Left]}"  ]] && bindkey -- "${key[Control-Left]}"  backward-word
[[ -n "${key[Control-Right]}" ]] && bindkey -- "${key[Control-Right]}" forward-word

####################################
#
# ALIASES CONFIG
#
####################################

# Check if the distro is Arch Linux for importing arch specific aliases.
distro=$($(uname -r | grep -Eq "arch") && echo "arch" || echo "n")

if [[ "$distro" == "arch" ]]; then
    source $ZDOTDIR/aliases/arch.zsh
else
    source $ZDOTDIR/aliases/debian.zsh
fi

####################################
#
# SHELL INTEGRATIONS CONFIG
#
####################################

############### fzf ################

eval "$(fzf --zsh)"

export FZF_DEFAULT_COMMAND='fd --type f --strip-cwd-prefix'

# Dracula theme
export FZF_DEFAULT_OPTS=" \
    --color=fg:#f8f8f2,hl:#bd93f9 \
    --color=fg+:#f8f8f2,bg+:#44475a,hl+:#bd93f9 \
    --color=info:#ffb86c,prompt:#50fa7b,pointer:#ff79c6 \
    --color=marker:#ff79c6,spinner:#ffb86c,header:#ff79c6"

fcd() {
	dir="$(fd -H --type d --max-depth 2 . $HOME $LEARNING_DIR $NOTES_DIR $PROJECTS_DIR | cut -d / -f 4- | uniq | fzf --preview 'eza -lagh --icons --group-directories-first --git --git-ignore --color=always $HOME/{} | head -n 50')";
	if [[ -n $dir ]]; then
		cd $HOME/$dir
	fi
}

bindkey -s "^O" "fcd^M"

bindkey -s "^F" "tmux-sessionizer^M"

# CTRL+I - Paste the selected entry from locate output into the command line
# fzf-locate-widget() {
#   local selected
#   if selected=$(locate / | fzf -q "$LBUFFER"); then
#     LBUFFER=$selected
#   fi
#   zle redisplay
# }
# zle -N fzf-locate-widget
# bindkey "^I" fzf-locate-widget

############# zoxide ###############

eval "$(zoxide init zsh)"

############### nvm ################

source /usr/share/nvm/init-nvm.sh

# place this after nvm initialization!
autoload -U add-zsh-hook

load-nvmrc() {
  local nvmrc_path
  nvmrc_path="$(nvm_find_nvmrc)"

  if [ -n "$nvmrc_path" ]; then
    local nvmrc_node_version
    nvmrc_node_version=$(nvm version "$(cat "${nvmrc_path}")")

    if [ "$nvmrc_node_version" = "N/A" ]; then
      nvm install
    elif [ "$nvmrc_node_version" != "$(nvm version)" ]; then
      nvm use
    fi
  elif [ -n "$(PWD=$OLDPWD nvm_find_nvmrc)" ] && [ "$(nvm version)" != "$(nvm version default)" ]; then
    echo "Reverting to nvm default version"
    nvm use default
  fi
}

add-zsh-hook chpwd load-nvmrc
load-nvmrc

####################################

# Display AN ELEPHANT on open so I don't lose terminal placement because of transparency
repo-elephant | lolcat
