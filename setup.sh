#!/usr/bin/env bash

# Set up soft links to configs
ln -s ~/dotfiles/.vimrc ~/.vimrc
ln -s ~/dotfiles/.screenrc ~/.screenrc

# Vim - install Vundle
if [ ! -d ~/.vim/bundle/Vundle.vim ]
then
	echo "working on git"
    git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
fi

