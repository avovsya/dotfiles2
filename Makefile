all:
	[ -d ~/.vim/bundle/vundle ] || git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle
	[ -f ~/.zshrc ] || ln -s ~/dotfiles/.zshrc ~/.zshrc
	[ -f ~/.gitconfig ] || ln -s ~/dotfiles/.gitconfig ~/.gitconfig
	[ -f ~/.tmux.conf ] || ln -s ~/dotfiles/.tmux.conf ~/.tmux.conf
	[ -f ~/.vimrc ] || ln -s ~/dotfiles/.vimrc ~/.vimrc
	[ -d ~/.ssh ] || mkdir ~/.ssh
	[ -f ~/.ssh/config ] || ln -s ~/dotfiles/config ~/.ssh/config

.PHONY: all
