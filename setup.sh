#!/usr/bin/env bash
# ===============================================================
# File:                 $HOME/dotfiles/setup.sh
# Purpose:              Idempotent Setup file for various dot files (config files)
# Compiled by:          David Lieu
# Latest update:        December 18, 2015
# ===============================================================

###
# Backup existing dot files
###
echo "Backup existing dot files (if required)..."
mkdir -p ~/docs/backup
# Backup vimrc
if [ -L $HOME/.vimrc ] && [ "$(readlink $HOME/.vimrc)" = "$HOME/dotfiles/.vimrc" ];
then
	:
else
	mv $HOME/.vimrc $HOME/docs/backup/.vimrc_$HOSTNAME_$(date +%Y%m%d)
fi

# Backup screenrc
if [ -L $HOME/.screenrc ] && [ "$(readlink $HOME/.screenrc)" = "$HOME/dotfiles/.screenrc" ];
then
	:
else
	mv $HOME/.screenrc $HOME/docs/backup/.screenrc_$HOSTNAME_$(date +%Y%m%d)
fi

# Alert .vim has more than one folder


###
# Set up soft links to configs
###
echo "Setup sym links to dotfiles (if required)..."
if [ -L $HOME/.vimrc ] && [ "$(readlink $HOME/.vimrc)" = "$HOME/dotfiles/.vimrc" ];
then
	echo ".vimrc sym link exists already"
else
	ln -s $HOME/dotfiles/.vimrc $HOME/.vimrc
fi


if [ -L $HOME/.screenrc ] && [ "$(readlink $HOME/.screenrc)" = "$HOME/dotfiles/.screenrc" ];
then
	echo ".screenrc sym link exists already"
else
	ln -s $HOME/dotfiles/.screenrc $HOME/.screenrc
fi

###
# Vim - install Vundle
###
if [ ! -d $HOME/.vim/bundle/Vundle.vim ]
then
	echo "Setup Vim plugin manager (Vundle)..."
	git clone https://github.com/VundleVim/Vundle.vim.git $HOME/.vim/bundle/Vundle.vim
fi

