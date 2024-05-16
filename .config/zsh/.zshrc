# Check if the distro is Arch Linux for importing arch specific aliases.
distro=$($(uname -r | grep -Eq "arch") && echo "arch" || echo "n")

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
source "${ZINIT_HOME}/zinit.zsh"

# Plugins
zinit light Aloxaf/fzf-tab
zinit light zsh-users/zsh-syntax-highlighting
zinit light zsh-users/zsh-completions
zinit light zsh-users/zsh-autosuggestions

# zsh-syntax-highlighting settings
# Specifically, remove underline
zle_highlight=('paste:none')
(( ${+ZSH_HIGHLIGHT_STYLES} )) || typeset -A ZSH_HIGHLIGHT_STYLES
# ZSH_HIGHLIGHT_STYLES[precommand]=fg=green
ZSH_HIGHLIGHT_STYLES[path]=none
# ZSH_HIGHLIGHT_STYLES[path_prefix]=none

####################################
#
# COMPLETIONS CONFIG
#
####################################

autoload -Uz compinit && compinit -d $XDG_CACHE_HOME/.zcompdump-$ZSH_VERSION
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
zstyle ':completion:*' menu no
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'eza -a --color=always $realpath'

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

if [[ "$distro" == "arch" ]]; then
    source $ZDOTDIR/aliases-arch.zsh
else
    source $ZDOTDIR/aliases-debian.zsh
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
bindkey -s "^o" "fcd^M"

# Make use of tmux-sessionizer
bindkey -s "^F" "tmux-sessionizer^M"


##################################

# Display AN ELEPHANT on open so I don't lose terminal placement because of transparency
repo-elephant | lolcat
