#!/usr/bin/env bash

#install tmux, etc.
apt-get install -y tmux ctags

#envset
cp .tmux.conf ~/.tmux.conf
cp .vimrc ~/.vimrc

#Vim Plugins
mkdir -p ~/.vim/autoload
wget -O ~/.vim/autoload/plug.vim \
	    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
vim +'PlugInstall --sync' +qa

#bashrc settings
#echo "alias confloc='./configure --prefix=${HOME}/.local'" >> ~/.bashrc
#echo "alias ca='conda activate'"  >> ~/.bashrc
#echo "bindkey '^[[C' emacs-forward-word"  >> ~/.bashrc
#echo "bindkey '^[[D' emacs-backward-word"  >> ~/.bashrc
#echo "bindkey '^W' backward-kill-word"  >> ~/.bashrc
