#!/usr/bin/env bash


# install neovim
mkdir -p $HOME/.local/bin
wget -O $HOME/.local/bin/nvim https://github.com/neovim/neovim/releases/download/v0.4.3/nvim.appimage
chmod +x $HOME/.local/bin/nvim
echo "alias vim='nvim'" >> $HOME/.bashrc
source $HOME/.bashrc

# install vimrc
mkdir -p $HOME/.config/nvim
cp vimrc $HOME/.config/nvim/
