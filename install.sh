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
# brew cask install emacs

# Install Homebrew
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

# Install ag search tool
brew install the_silver_searcher

# Link dot files
cd ~/

mkdir -p ~/.config/fish
mkdir -p ~/.config/karabiner

ln -s ~/dotfiles/config.fish ~/.config/fish/config.fish
ln -s ~/dotfiles/.zshrc ~/.zshrc
ln -s ~/dotfiles/.gitconfig ~/.gitconfig
ln -s ~/dotfiles/.tmux.conf ~/.tmux.conf
ln -s ~/dotfiles/.vimrc ~/.vimrc

ln -s ~/dotfiles/karabiner.json ~/.config/karabiner/karabiner.json


########
# FISH #
########
# https://github.com/JorgeBucaran/awesome-fish
pip install virtualfish

brew install tmux

# Install fzf https://github.com/junegunn/fzf
brew install fzf

# Install Oh My Fish:
curl -L https://get.oh-my.fish | fish

# Install z https://github.com/rupa/z:
# Alternative: https://github.com/jethrokuan/z
omf install z

# Install NVM(Node version manager) in Fish shell
omf install nvm

# Install Fisher(fish plugin manager)
curl https://git.io/fisher --create-dirs -sLo ~/.config/fish/functions/fisher.fish

# Install Bax https://github.com/jorgebucaran/fish-bax
fisher add jorgebucaran/fish-bax