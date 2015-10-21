#! /bin/bash

wget https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -
ln -s ~/dotfiles/.spacemacs ~/.spacemacs
git clone https://github.com/syl20bnr/spacemacs ~/.emacs.d
rm -rf ~/.emacs.d/private/snippets
mkdir -p ~/.emacs.d/private && ln -s ~/dotfiles/snippets ~/.emacs.d/private/snippets
ln -s ~/dotfiles/.zshrc ~/.zshrc
ln -s ~/dotfiles/.gitconfig ~/.gitconfig
ln -s ~/dotfiles/.tmux.conf ~/.tmux.conf
ln -s ~/dotfiles/.vimrc ~/.vimrc
