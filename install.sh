#! /bin/bash

# PREREQUISITES
# zsh
# fish shell
# git
# curl
# emacs

# ZSH
curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh

# FISH SHELL
mkdir -p ~/.config/fish

# EMACS
if [[ "$OSTYPE" == "darwin" ]]; then
    ln -s ~/dotfiles/emacs /usr/local/bin/emacs
fi
ln -s ~/dotfiles/.spacemacs ~/.spacemacs
git clone https://github.com/syl20bnr/spacemacs ~/.emacs.d
# rm -rf ~/.emacs.d/private/snippets
# mkdir -p ~/.emacs.d/private && ln -s ~/dotfiles/snippets ~/.emacs.d/private/snippets
# TODO: snippets

# OTHER
ln -s ~/dotfiles/config.fish ~/.config/fish/config.fish
ln -s ~/dotfiles/.zshrc ~/.zshrc
ln -s ~/dotfiles/.gitconfig ~/.gitconfig
ln -s ~/dotfiles/.tmux.conf ~/.tmux.conf
ln -s ~/dotfiles/.vimrc ~/.vimrc
