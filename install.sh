#! /bin/bash

# PREREQUISITES
# zsh
# fish shell
# git
# curl
# emacs
# TODO: https://hackercodex.com/guide/mac-osx-mavericks-10.9-configuration/
# TODO: install silversearcher(ag) for linux and OS X

# Install emacs https://www.emacswiki.org/emacs/EmacsForMacOS#toc15
brew cask install emacs

# Install ag search tool
brew install the_silver_searcher

# Launch emacs daemon on startup https://emacs.stackexchange.com/questions/8169/how-can-i-run-emacs-24-x-app-on-mac-os-x-in-daemon-mode
ln -sfv /usr/local/opt/emacs/*.plist ~/Library/LaunchAgents
launchctl load ~/Library/LaunchAgents/homebrew.mxcl.emacs.plist

# Install fzf https://github.com/junegunn/fzf
# Fuzzy finder for command line brew install fzf

# Install z https://github.com/rupa/z

# Link dot files
cd ~/

mkdir -p ~/.config/fish
#rm .gitconfig .tmux.conf .vimrc # .config/fish/config.fish .spacemacs

ln -s ~/dotfiles/config.fish ~/.config/fish/config.fish
ln -s ~/dotfiles/.gitconfig ~/.gitconfig
ln -s ~/dotfiles/.tmux.conf ~/.tmux.conf
ln -s ~/dotfiles/.vimrc ~/.vimrc
