## APPS
# python3
alias python='python3'
alias py='python'
alias ipython='ipython3'
alias ipy='ipython'

# chancellor-cli
alias ch='chancellor'

# R
alias r="radian"

## SHELL
# ls
alias ls='command ls -FH --color=auto '
alias ll='ls -lA '
alias l='ll'
# alias l='lsd --oneline --group-dirs first --almost-all --classify --color=always --icon-theme=unicode --long '

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
alias apt="sudo apt"
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

