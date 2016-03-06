# Load local configuration
source ~/.local.fish

############################################################################################
# ALIASES
############################################################################################
alias tmux="TERM=screen-256color tmux"

alias l="ls -lAhG"
alias ssh="ssh -A"

alias ps="ps aux"

# alias vim="reattach-to-user-namespace vim"
############################################################################################
# EXPORTS
############################################################################################
set -x EDITOR vi

set -x TERM xterm-256color
set -x GOPATH $HOME/Documents/projects/go

set PATH $GOPATH/bin $PATH

set -x GOPATH $HOME/go
set -x PATH $PATH:$GOPATH/bin

setxkbmap -option ctrl:nocaps