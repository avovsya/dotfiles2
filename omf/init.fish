# Load local configuration
source ~/.local.fish

############################################################################################
# ALIASES
############################################################################################
alias tmux="TERM=screen-256color tmux"

alias l="ls -lAhG"
alias ssh="ssh -A"

alias ps="ps aux"

alias vim="reattach-to-user-namespace vim"

############################################################################################
# EXPORTS
############################################################################################
set -x EDITOR vim

export TERM=xterm-256color

setxkbmap -option ctrl:nocaps