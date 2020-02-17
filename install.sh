#!/usr/bin/env bash


# install vimrc
cp vimrc $HOME/.vimrc
mkdir $HOME/.vim
cp -a ./pack $HOME/.vim/

# install tmux
cp tmux.conf $HOME/.tmux.conf
