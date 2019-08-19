#!/usr/bin/env bash

#install fzf
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install

#install autojump
git clone git://github.com/wting/autojump.git
cd autojump
./install.py
cd ..
echo "plugins=(autojump)" >> ${ZDOTDIR:-$HOME}/.zshrc
	
#install autosuggestion
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
echo "source ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh" >> ${ZDOTDIR:-$HOME}/.zshrc

#install syntax-highlighting
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
echo "source ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh" >> ${ZDOTDIR:-$HOME}/.zshrc

#anaconda init
conda init zsh

#install neovim
add-apt-repository ppa:neovim-ppa/stable
apt-get update
apt-get install -y neovim

#envset
git clone https://github.com/TPFRL/envset.git
cp envset/.tmux.conf ~/.tmux.conf
cp -r envset/.config ~

curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

nvim +'PlugInstall --sync' +qa

echo "alias confloc='./configure --prefix=${HOME}/.local'" >> ${ZDOTDIR:-$HOME}/.zshrc

echo "alias ca='conda activate'"  >> ${ZDOTDIR:-$HOME}/.zshrc
echo "bindkey '^[[C' emacs-forward-word"  >> ${ZDOTDIR:-$HOME}/.zshrc
echo "bindkey '^[[D' emacs-backward-word"  >> ${ZDOTDIR:-$HOME}/.zshrc
echo "bindkey '^W' kill-word"  >> ${ZDOTDIR:-$HOME}/.zshrc
