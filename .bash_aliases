#!/bin/bash
## DOCKER
alias d='docker '
alias drun='docker run '
alias dr='drun -it --rm '

## APPS
# python3
alias python='python3'
alias py='python'
alias ipython='ipython3'
alias ipy='ipython'
# rstudio
alias rstudio='cmd.exe /C start microsoft-edge:http://localhost:8787; docker run --name "ruh_roh" --rm -ti -e DISABLE_AUTH=true -p 8787:8787 -v rstudio:/home/rstudio -v "$(pwd):/home/rstudio/work" rocker/verse:latest'
alias ruhroh='rstudio'
alias rr='rstudio'
# loco
alias loco='cmd.exe /C start microsoft-edge:http://localhost:8889; docker run --rm -ti --name "local_loco" -e RESTARTABLE=yes -p 8889:8888/tcp -v jovyan:/home/jovyan -v "$(pwd):/home/jovyan/work" matthewbegun/loco:latest start-notebook.py --IdentityProvider.token='''
alias notbook='loco'
alias nb='loco'
# Rscript
alias Rscript='docker run --rm r-base Rscript -e '
# radian
alias r='docker run --rm -ti ghcr.io/rocker-org/devcontainer/r-ver:4 radian '
# R
alias R='docker run --rm -ti r-base R '
# jq
alias jq='docker run --rm -ti ghcr.io/jqlang/jq '
# chancellor-cli
alias chancellor='docker run --rm -ti chancellor '
alias ch='chancellor '

## SHELL
# ls
alias ls='command ls -FH --color=auto '
alias ll='ls -lA '
alias l='lsd --oneline --group-dirs first --almost-all --classify --color=always --icon-theme=unicode --long '
# ...
alias cd..='cd ..'
alias ..='cd ..'
alias ...='cd ../../..'
alias ....='cd ../../../..'
alias .....='cd ../../../..'
alias .3='cd ../../..'
alias .4='cd ../../../..'
alias .5='cd ../../../../..'

# install with apt-get
alias apt-get="sudo apt-get"
alias update='sudo apt-get update && sudo apt-get upgrade -y'
alias up="update"

# sudo
alias sudo='sudo '
alias su='sudo -i'

# careful
alias cp='cp -iv'
alias mv='mv -iv'
alias rm='rm -Iv'
alias mkdir='mkdir -p'
alias ps='ps auxf'

# Remove a directory and all files
alias rmd='/bin/rm  --recursive --force --verbose '

# Creates a directory and changes to it.
# Syntax: `mkcd <directory>`
function mkcd() {
    if [ -z "$1" ]; then
        echo "Usage: mkcd <path>"
        echo "Help: mkcd creates a directory if it doesn't exist, then changes to it."
        return 0
    fi

    mkdir -p -- "$@" && cd -P -- "$_" || exit
}
alias take=mkcd

# Stops ping after sending 4 ECHO_REQUEST packets.
alias ping='ping -c 4'
