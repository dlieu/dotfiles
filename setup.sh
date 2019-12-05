#!/usr/bin/env bash
# ===============================================================
# File:                 $HOME/dotfiles/setup.sh
# Purpose:              Idempotent Setup file for various dot files (config files)
# Compiled by:          David Lieu
# ===============================================================

###
# Backup existing dot files
###
echo "Backup existing dot files (if required)..."
mkdir -p ~/archive/dotfiles

# Backup vimrc
if [ -L $HOME/.vimrc ] && [ "$(readlink $HOME/.vimrc)" = "$HOME/main/workspace/dotfiles/.vimrc" ];
then
	:
else
	mv $HOME/.vimrc $HOME/archive/dotfiles/.vimrc_$HOSTNAME_$(date +%Y%m%d)
fi

# Backup neovim init.vim
if [ -L $HOME/.config/nvim/init.vim ] && [ "$(readlink $HOME/.config/nvim/init.vim)" = "$HOME/main/workspace/dotfiles/init.vim" ];
then
	:
else
	mv $HOME/.config/nvim/init.vim $HOME/archive/dotfiles/nvim_init_vim_$HOSTNAME_$(date +%Y%m%d)
fi

# Backup screenrc
if [ -L $HOME/.screenrc ] && [ "$(readlink $HOME/.screenrc)" = "$HOME/main/workspace/dotfiles/.screenrc" ];
then
	:
else
	mv $HOME/.screenrc $HOME/archive/dotfiles/.screenrc_$HOSTNAME_$(date +%Y%m%d)
fi

# Alert .vim has more than one folder


###
# Set up soft links to configs
###
echo "Setup sym links to dotfiles (if required)..."
if [ -L $HOME/.vimrc ] && [ "$(readlink $HOME/.vimrc)" = "$HOME/main/workspace/dotfiles/.vimrc" ];
then
	echo ".vimrc sym link exists already"
else
	ln -s $HOME/main/workspace/dotfiles/.vimrc $HOME/.vimrc
fi


if [ -L $HOME/.config/nvim/init.vim ] && [ "$(readlink $HOME/.config/nvim/init.vim)" = "$HOME/main/workspace/dotfiles/init.vim" ];
then
	echo "neovim init.vim sym link exists already"
else
	ln -s $HOME/main/workspace/dotfiles/init.vim $HOME/.config/nvim/init.vim
fi

if [ -L $HOME/.screenrc ] && [ "$(readlink $HOME/.screenrc)" = "$HOME/main/workspace/dotfiles/.screenrc" ];
then
	echo ".screenrc sym link exists already"
else
	ln -s $HOME/main/workspace/dotfiles/.screenrc $HOME/.screenrc
fi

###
# Vim - install Vundle
###
if [ ! -d $HOME/.vim/bundle/Vundle.vim ]
then
	echo "Setup Vim plugin manager (Vundle)..."
	git clone https://github.com/VundleVim/Vundle.vim.git $HOME/.vim/bundle/Vundle.vim
fi

