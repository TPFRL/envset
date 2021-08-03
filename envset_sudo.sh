#!/usr/bin/env bash
# zsh installation
sudo apt-get install -y zsh
wget https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh -O - | zsh || true

#install tmux, etc.
sudo apt-get install -y tmux silversearcher-ag ctags htop rsync

#install fzf
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install

#install autosuggestion
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
echo "source ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh" >> ${ZDOTDIR:-$HOME}/.zshrc

#install syntax-highlighting
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
echo "source ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh" >> ${ZDOTDIR:-$HOME}/.zshrc

#envset
cp .tmux.conf ~/

#zshrc settings
echo "alias confloc='./configure --prefix=${HOME}/.local'" >> ${ZDOTDIR:-$HOME}/.zshrc
echo "alias ca='conda activate'"  >> ${ZDOTDIR:-$HOME}/.zshrc
echo "bindkey '^[[C' emacs-forward-word"  >> ${ZDOTDIR:-$HOME}/.zshrc
echo "bindkey '^[[D' emacs-backward-word"  >> ${ZDOTDIR:-$HOME}/.zshrc
echo "bindkey '^W' backward-kill-word"  >> ${ZDOTDIR:-$HOME}/.zshrc


cp minimum/.vimrc ~/.vimrc

#Vim Plugins
mkdir -p ~/.vim/autoload
wget -O ~/.vim/autoload/plug.vim \
	    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
vim +'PlugInstall --sync' +qa


#anaconda init.. This doesn't work in DockerFile
conda init zsh
conda init bash

##install jemalloc
#wget https://github.com/jemalloc/jemalloc/releases/download/5.2.1/jemalloc-5.2.1.tar.bz2
#tar xvjf jemalloc-5.2.1.tar.bz2
#cd jemalloc-5.2.1 && ./configure && make -j 16 && sudo make install
#echo "alias usejm='LD_PRELOAD=/usr/local/lib/libjemalloc.so'"  >> ${ZDOTDIR:-$HOME}/.zshrc
#
## fix cursor error
#sudo apt-get install -y locales && \
#localedef -i en_US -c -f UTF-8 -A /usr/share/locale/locale.alias en_US.UTF-8
#
#echo "export PATH=/usr/local/cuda/bin:$PATH" >> ${ZDOTDIR:-$HOME}/.zshrc
#echo "export LC_ALL=en_US.UTF-8" >> ${ZDOTDIR:-$HOME}/.zshrc
#echo "export LC_CTYPE=en_US.UTF-8" >> ${ZDOTDIR:-$HOME}/.zshrc
#echo "export LANG=en_US.UTF-8" >> ${ZDOTDIR:-$HOME}/.zshrc

##Pip installation
#pip install gpustat
