# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

ZSH_THEME="robbyrussell"

# Enable autojump plugin
# Install plugin: brew install autojump
[[ -s `brew --prefix`/etc/autojump.sh ]] && . `brew --prefix`/etc/autojump.sh

# Uncomment following line if you want to disable autosetting terminal title.
DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
# COMPLETION_WAITING_DOTS="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git)

source $ZSH/oh-my-zsh.sh

# Customize to your needs...
export PATH=$PATH:/usr/bin:/bin:/usr/sbin:/usr/local/sbin:/sbin:/usr/local/bin:/usr/local/share/npm/bin:$PATH:$HOME/bin

# Disable XOFF in terminal allow use the Ctrl+S combination in VIM
stty ixany
stty ixoff -ixon

setopt autocd

############################################################################################
# ALIASES
############################################################################################
alias tmux="TERM=screen-256color tmux"

alias l="ls -lAhG"
alias ssh="ssh -A"

alias mvim="reattach-to-user-namespace mvim"
alias vim="reattach-to-user-namespace vim"

############################################################################################
# EXPORTS
############################################################################################
export EDITOR=vim

unset LC_ALL
export LANG=C
export LC_CTYPE="ru_RU.UTF-8"
export LC_NUMERIC="ru_RU.UTF-8"
export LC_TIME="ru_RU.UTF-8"
export LC_COLLATE="ru_RU.UTF-8"
export LC_MONETARY="ru_RU.UTF-8"
export LC_MESSAGES="ru_RU.UTF-8"
export LC_PAPER="ru_RU.UTF-8"
export LC_NAME="ru_RU.UTF-8"
export LC_ADDRESS="ru_RU.UTF-8"
export LC_TELEPHONE="ru_RU.UTF-8"
export LC_MEASUREMENT="ru_RU.UTF-8"
export LC_IDENTIFICATION="ru_RU.UTF-8"


############################################################################################
# VIM MODE
############################################################################################

#function zle-line-init zle-keymap-select {
    #VIM_PROMPT="%{$fg_bold[yellow]%} [% NORMAL]%  %{$reset_color%}"
    #RPS1="${${KEYMAP/vicmd/$VIM_PROMPT}/(main|viins)/}$(git_custom_status) $EPS1"
    #zle reset-prompt
#}

#zle -N zle-line-init
#zle -N zle-keymap-select

# Remove lag when changing mods
export KEYTIMEOUT=20

bindkey -v

# Use jk for ESC
bindkey -M viins 'jk' vi-cmd-mode

#bindkey '^P' up-history
#bindkey '^N' down-history
bindkey '^P' history-beginning-search-backward
bindkey '^N' history-beginning-search-forward
bindkey '^r' history-incremental-search-backward

#bindkey '^j' vi-cmd-mode
#bindkey '^?' backward-delete-char
#bindkey '^h' backward-delete-char
#bindkey '^w' backward-kill-word

