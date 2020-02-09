#!/usr/bin/env bash


# install neovim
mkdir -p $HOME/.local/bin
wget -O $HOME/.local/bin/nvim.appimage https://github.com/neovim/neovim/releases/download/v0.4.3/nvim.appimage
chmod +x $HOME/.local/bin/nvim.appimage
cd $HOME/.local/bin/
./nvim.appimage --appimage-extract
rm -rf ./nvim.appimage
echo "alias vim='$HOME/.local/bin/squashfs-root/usr/bin/nvim'" >> $HOME/.bashrc
source $HOME/.bashrc
cd -

# install vimrc
mkdir -p $HOME/.config/nvim
cp vimrc $HOME/.config/nvim/init.vim
