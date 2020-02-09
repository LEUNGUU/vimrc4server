#!/usr/bin/env bash


# install neovim
mkdir -p $HOME/.local/bin
wget -O $HOME/.local/bin/nvim https://github.com/neovim/neovim/releases/download/v0.4.3/nvim.appimage

# install vimrc
mkdir -p $HOME/.config/nvim
mv vimrc $HOME/.config/nvim
