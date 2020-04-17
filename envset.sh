#!/usr/bin/env bash

#install tmux, etc.
apt-get install -y tmux silversearcher-ag ctags htop rsync

#install jemalloc
wget https://github.com/jemalloc/jemalloc/releases/download/5.2.1/jemalloc-5.2.1.tar.bz2
tar xvjf jemalloc-5.2.1.tar.bz2
cd jemalloc-5.2.1 && ./configure && make -j 16 && make install
echo "alias usejm='LD_PRELOAD=/usr/local/lib/libjemalloc.so'"  >> ${ZDOTDIR:-$HOME}/.zshrc

#install fzf
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install

#install autosuggestion
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
echo "source ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh" >> ${ZDOTDIR:-$HOME}/.zshrc

#install syntax-highlighting
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
echo "source ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh" >> ${ZDOTDIR:-$HOME}/.zshrc

#anaconda init
conda init zsh

#install neovim
apt-get install -y software-properties-common 
add-apt-repository ppa:neovim-ppa/stable
apt-get update
apt-get install -y neovim
pip install neovim

#envset
cp .tmux.conf ~/.tmux.conf
cp -r .config ~

#Vim Plugins
curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
nvim +'PlugInstall --sync' +qa

#Pip installation
pip install gpustat

#zshrc settings
echo "alias confloc='./configure --prefix=${HOME}/.local'" >> ${ZDOTDIR:-$HOME}/.zshrc
echo "alias ca='conda activate'"  >> ${ZDOTDIR:-$HOME}/.zshrc
echo "bindkey '^[[C' emacs-forward-word"  >> ${ZDOTDIR:-$HOME}/.zshrc
echo "bindkey '^[[D' emacs-backward-word"  >> ${ZDOTDIR:-$HOME}/.zshrc
echo "bindkey '^W' backward-kill-word"  >> ${ZDOTDIR:-$HOME}/.zshrc
