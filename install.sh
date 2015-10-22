#! /bin/bash

# PREREQUISITES
# zsh
# fish shell
# git
# curl
# emacs

# ZSH
curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh
ln -s ~/dotfiles/.zshrc ~/.zshrc

# FISH SHELL
curl -L https://github.com/oh-my-fish/oh-my-fish/raw/master/bin/install | fish
rm -rf ~/.config/omf
ln -s ~/dotfiles/omf/ ~/.config/omf 

# EMACS
ln -s ~/dotfiles/.spacemacs ~/.spacemacs
git clone https://github.com/syl20bnr/spacemacs ~/.emacs.d
rm -rf ~/.emacs.d/private/snippets
mkdir -p ~/.emacs.d/private && ln -s ~/dotfiles/snippets ~/.emacs.d/private/snippets

# OTHER
ln -s ~/dotfiles/.gitconfig ~/.gitconfig
ln -s ~/dotfiles/.tmux.conf ~/.tmux.conf
ln -s ~/dotfiles/.vimrc ~/.vimrc
