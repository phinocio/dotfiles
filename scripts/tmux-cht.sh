#!/usr/bin/env bash

selected=`cat $XDG_CONFIG_HOME/tmux/.tmux-cht-languages $XDG_CONFIG_HOME/tmux/.tmux-cht-commands | fzf`
if [[ -z $selected ]]; then
    exit 0
fi

read -p "Enter Query: " query

if grep -qs "$selected" $XDG_CONFIG_HOME/tmux/.tmux-cht-languages; then
    query=`echo $query | tr ' ' '+'`
    tmux neww bash -c "curl -s cht.sh/$selected/$query | bat"
else
    tmux neww bash -c "curl -s cht.sh/$selected~$query | bat"
fi
