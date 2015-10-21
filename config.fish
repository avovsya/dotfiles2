# Path to Oh My Fish install.
set -gx OMF_PATH /Users/avovsya/.local/share/omf

# Customize Oh My Fish configuration path.
#set -gx OMF_CONFIG /Users/avovsya/.config/omf

# Load oh-my-fish configuration.
source $OMF_PATH/init.fish


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