#!/usr/bin/env bash
# ===============================================================
# File:                 $HOME/dotfiles/setup.sh
# Purpose:              Idempotent Setup file for various dot files (config files)
# Compiled by:          David Lieu
# Latest update:        December 14, 2015
# ===============================================================

# Backup existing dot files
mkdir -p ~/docs/backup
mv ~/.vimrc ~/docs/backup/.vimrc_$(date +%y%m%d)
mv ~/.screenrc ~/docs/backup/.screenrc_$(date +%y%m%d)

# Set up soft links to configs
ln -s ~/dotfiles/.vimrc ~/.vimrc
ln -s ~/dotfiles/.screenrc ~/.screenrc

# Vim - install Vundle
if [ ! -d ~/.vim/bundle/Vundle.vim ]
then
	echo "working on git"
    git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
fi

