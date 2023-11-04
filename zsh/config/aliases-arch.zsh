# Sometimes has issues to force it via alias
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."

# General command aliases
alias cp="cp -i -v"											# verbose cp with confirmation
alias mv="mv -i -v"											# verbose mv with confirmation
alias rm="rm -I -v"											# verbose rm with confirmation
alias grep="grep --color"
alias wget="wget --hsts-file=$XDG_CACHE_HOME/.wget-hist"
alias ip="ip -c"
# alias ssh="kitty +kitten ssh --kitten color_scheme=\"Adventure Time\""
alias part="php artisan"
alias sail='[ -f sail ] && sh sail || sh vendor/bin/sail'
alias vim="nvim"
alias hist="history -i"
alias tree="tree -C -F"
alias cat="bat"
# alias nvim="kitty --detach -o window_padding_width=0 nvim"
alias :q="exit"

# File and folder listing
alias ls="exa -lghF --icons --group-directories-first"
alias lsg="exa -lghF --icons --group-directories-first --git --git-ignore"
alias lst="exa -lghFT --icons --group-directories-first --git-ignore"
alias ll="exa -laghF --icons --group-directories-first"
alias llg="exa -laghF --icons --group-directories-first --git --git-ignore"
alias llt="exa -laghFT --icons --group-directories-first --git-ignore"

# Arch packages stuff
alias yayi="yay -S"
alias yayq="yay -Qi"
alias yays="yay -Ss"
alias yeet="yay -Rns"
alias yaysi="yay -Si"
alias paci="sudo pacman -S"
alias pacui="sudo pacman -Rns"
alias pacclean="sudo pacman -Rns $(pacman -Qtdq)"
alias pacum="sudo systemctl start reflector.service"

# Git commands
alias ga="git add"
alias gc="git commit -S"

# Project CDing
alias lol="cd $PROJECTS_WEB/loadorderlibrary"
alias lolapi="cd $PROJECTS_API/loadorderlibrary-api"

# Common config files I edit
alias ekitty="$VISUAL $XDG_CONFIG_HOME/kitty/kitty.conf"
alias econky="$VISUAL $XDG_CONFIG_HOME/conky/conky.conf"
alias fixdiscord="sudo $EDITOR /opt/discord/resources/build_info.json"

# zsh editing and updating
alias zshen="$VISUAL ~/.zshenv"
alias zshu="source $ZDOTDIR/.zshrc"
alias zshrc="$VISUAL $ZDOTDIR/.zshrc"
alias zshal="$VISUAL $ZDOTDIR/aliases-arch.zsh"

# Docker aliases
alias pandock=\
'docker run --rm -v "$(pwd):/data" -u $(id -u):$(id -g) pandoc/extra'

# Docker
alias dc="docker-compose"
alias dock="docker"

# Note taking
note() {NOTE_DIR="$HOME/Documents/Notes"; NOTE_NAME="$1"; TIMESTAMP="$(date +%Y-%m-%d_%H:%M)"; cd "${NOTE_DIR}" && nvim "${NOTE_DIR}/${TIMESTAMP}-${NOTE_NAME}.md" && cd - ;}
