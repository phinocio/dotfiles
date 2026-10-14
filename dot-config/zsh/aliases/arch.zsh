####################################
# General
####################################
alias mv='mv -i -v'
alias grep='grep --color=auto'
alias vim='nvim'
alias hist='history -i'
alias cp='cp -iv'
alias rm="trash -v"

####################################
# File listing
####################################
alias ls='eza -lghF --icons --group-directories-first'
alias lsg='eza -lghF --icons --group-directories-first --git --git-ignore'
alias lst='eza -lghFT --icons --group-directories-first --git-ignore'
alias ll='eza -laghF --icons --group-directories-first'
alias llg='eza -laghF --icons --group-directories-first --git --git-ignore'
alias llt='eza -laghFT --icons --group-directories-first --git-ignore'
alias tree='eza --icons --group-directories-first --tree'
alias cat='bat --paging=never --plain'

####################################
# Git
####################################
alias gst='git status'
alias gsw='git switch'
alias lg='lazygit'
alias lzd='lazydocker'

####################################
# Zsh
####################################
alias zshu='source $ZDOTDIR/.zshrc'

####################################
# AUR helper
####################################
alias yay='paru'
alias yayi='paru -S'
alias yayq='paru -Qi'
alias yays='paru -Ss'
alias yaysi='paru -Si'
alias yeet='paru -Rns'

####################################
# Pacman
####################################
alias paci='sudo pacman -S'
alias pacui='sudo pacman -Rns'
alias pacum='sudo systemctl start reflector.service'

####################################
# Laravel
####################################
alias sail='[ -f sail ] && sh sail || sh vendor/bin/sail'
alias part="php artisan"
alias sart="sail artisan"
