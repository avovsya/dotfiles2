# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

ZSH_THEME="robbyrussell"

# Uncomment following line if you want to disable autosetting terminal title.
DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
# COMPLETION_WAITING_DOTS="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git osx emacs brew npm man node)

source $ZSH/oh-my-zsh.sh

# Customize to your needs...
export PATH=$PATH:/usr/bin:/bin:/usr/sbin:/usr/local/sbin:/sbin:/usr/local/bin:/usr/local/share/npm/bin:$PATH:$HOME/bin

# Homebrew
export PATH=/usr/local/bin:/usr/local/sbin:$PATH

setopt autocd

############################################################################################
# ALIASES
############################################################################################
alias tmux="TERM=screen-256color tmux"

alias l="ls -lAhG"
alias ssh="ssh -A"

alias ps="ps aux"
############################################################################################
# EXPORTS
############################################################################################
export EDITOR=em
