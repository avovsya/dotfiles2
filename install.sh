#! /bin/bash

# PREREQUISITES
# zsh
# fish shell
# git
# curl
# emacs
# TODO: https://hackercodex.com/guide/mac-osx-mavericks-10.9-configuration/
# TODO: install silversearcher(ag) for linux and OS X

# ZSH
# curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh

# EMACS
if [[ "$OSTYPE" == "darwin" ]]; then
    ln -s ~/dotfiles/emacs /usr/local/bin/emacs
fi
git clone https://github.com/syl20bnr/spacemacs ~/.emacs.d
# rm -rf ~/.emacs.d/private/snippets
# mkdir -p ~/.emacs.d/private && ln -s ~/dotfiles/snippets ~/.emacs.d/private/snippets
# TODO: snippets

# INSTALL FISH
if [[ "$OSTYPE" == "linux-gnu" ]]; then
        # ...
    sudo apt-add-repository ppa:fish-shell/release-2
    sudo apt-get update
    sudo apt-get install fish
    chsh -s /usr/bin/fish
elif [[ "$OSTYPE" == "darwin"* ]]; then
        # Mac OSX
    brew install fish
    echo "/usr/local/bin/fish" | sudo tee -a /etc/shells
    chsh -s /usr/local/bin/fish
else
    echo "ERROR: UNKNOWN OS"
        # Unknown.
fi
# END: INSTALL FISH

# Link dot files
cd ~/

mkdir -p ~/.config/fish
rm .zshrc .gitconfig .tmux.conf .vimrc .config/fish/config.fish .spacemacs

ln -s ~/dotfiles/.spacemacs ~/.spacemacs
ln -s ~/dotfiles/config.fish ~/.config/fish/config.fish
ln -s ~/dotfiles/.zshrc ~/.zshrc
ln -s ~/dotfiles/.gitconfig ~/.gitconfig
ln -s ~/dotfiles/.tmux.conf ~/.tmux.conf
ln -s ~/dotfiles/.vimrc ~/.vimrc
