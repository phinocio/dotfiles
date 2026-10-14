####################################
#
# Sourced helpers
#
####################################
[[ -r "$ZDOTDIR/functions.zsh" ]] && source "$ZDOTDIR/functions.zsh"

####################################
#
# History
#
####################################
mkdir -p "$XDG_STATE_HOME/zsh"
HISTFILE="$XDG_STATE_HOME/zsh/history"
HISTSIZE=100000
SAVEHIST=$HISTSIZE
HISTTIMEFORMAT="%F %T: "

setopt append_history
setopt share_history
setopt extended_history
setopt inc_append_history
setopt hist_ignore_space
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_find_no_dups
setopt hist_verify

####################################
#
# zinit
#
####################################
if [[ ! -d "$ZINIT_HOME/.git" ]]; then
  mkdir -p "$(dirname "$ZINIT_HOME")"
  git clone --depth 1 https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
fi

declare -A ZINIT
ZINIT[NO_ALIASES]='1'
ZINIT[ZCOMPDUMP_PATH]="$ZSH_CACHE_DIR/.zcompdump-$ZSH_VERSION"
source "$ZINIT_HOME/zinit.zsh"

####################################
#
# Completion
#
####################################
zinit light zsh-users/zsh-completions

autoload -Uz compinit

if [[ -n "$ZINIT[ZCOMPDUMP_PATH]"(#qN.mh+24) ]]; then
  compinit -C -d "$ZINIT[ZCOMPDUMP_PATH]"   # skip security check
else
  compinit -d "$ZINIT[ZCOMPDUMP_PATH]"
fi

zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
zstyle ':completion:*' menu no
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'eza -a --color=always $realpath'
zstyle ':fzf-tab:complete:__zoxide_z:*' fzf-preview 'eza -a --color=always $realpath'

####################################
#
# Plugins
#
####################################
zinit light Aloxaf/fzf-tab
zinit light zsh-users/zsh-autosuggestions
zinit light zsh-users/zsh-syntax-highlighting

zle_highlight+=('paste:none')
(( ${+ZSH_HIGHLIGHT_STYLES} )) || typeset -A ZSH_HIGHLIGHT_STYLES
ZSH_HIGHLIGHT_STYLES[precommand]=fg=green
ZSH_HIGHLIGHT_STYLES[path]=none

####################################
#
# Keybinds
#
####################################
source "$ZDOTDIR/keybinds.zsh"

####################################
#
# Aliases
#
####################################
source "$ZDOTDIR/aliases/arch.zsh"

####################################
#
# Shell integrations
#
####################################
# --- fzf ---
export FZF_DEFAULT_COMMAND='fd --type f --strip-cwd-prefix'
export FZF_DEFAULT_OPTS=" \
    --color=fg:#f8f8f2,hl:#bd93f9 \
    --color=fg+:#f8f8f2,bg+:#44475a,hl+:#bd93f9 \
    --color=info:#ffb86c,prompt:#50fa7b,pointer:#ff79c6 \
    --color=marker:#ff79c6,spinner:#ffb86c,header:#ff79c6"
eval "$(fzf --zsh)"          # official integration (replaces OMZ::fzf snippet)

# --- zoxide ---
eval "$(zoxide init zsh)"

# --- nvm ---
source /usr/share/nvm/init-nvm.sh
autoload -U add-zsh-hook
load-nvmrc() {
  local nvmrc_path nvmrc_node_version
  nvmrc_path="$(nvm_find_nvmrc)"
  if [[ -n $nvmrc_path ]]; then
    nvmrc_node_version=$(nvm version "$(<"$nvmrc_path")")
    if [[ $nvmrc_node_version == N/A ]]; then
      nvm install
    elif [[ $nvmrc_node_version != "$(nvm version)" ]]; then
      nvm use
    fi
  elif [[ -n "$(PWD=$OLDPWD nvm_find_nvmrc)" ]] && [[ "$(nvm version)" != "$(nvm version default)" ]]; then
    echo "Reverting to nvm default version"
    nvm use default
  fi
}
add-zsh-hook chpwd load-nvmrc
load-nvmrc

# --- pnpm ---
export PNPM_HOME="$HOME/.local/share/pnpm"
typeset -U path
path=("$PNPM_HOME" $path)

####################################
#
# Prompt — LAST
#
####################################
eval "$(starship init zsh)"

####################################
#
# Misc
#
####################################
pokemon-colorscripts-go --no-title
