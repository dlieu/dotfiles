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
mkdir -p ~/.config/nvim/
mkdir -p ~/.oci

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

# Backup bash_aliases
if [ -L $HOME/.bash_aliases ] && [ "$(readlink $HOME/.bash_aliases)" = "$HOME/main/workspace/dotfiles/bash_aliases" ];
then
	:
else
	mv $HOME/.bash_aliases $HOME/archive/dotfiles/bash_aliases_$HOSTNAME_$(date +%Y%m%d)
fi

# Backup gvim
if [ -L $HOME/.gvimrc ] && [ "$(readlink $HOME/.gvimrc)" = "$HOME/main/workspace/dotfiles/gvimrc" ];
then
	:
else
	mv $HOME/.gvimrc $HOME/archive/dotfiles/gvimrc_$HOSTNAME_$(date +%Y%m%d)
fi

# Backup tmux.conf
if [ -L $HOME/.tmux.conf ] && [ "$(readlink $HOME/.tmux.conf)" = "$HOME/main/workspace/dotfiles/tmux.conf" ];
then
	:
else
	mv $HOME/.tmux.conf $HOME/archive/dotfiles/tmux.conf_$HOSTNAME_$(date +%Y%m%d)
fi

# Backup gitconfig
if [ -L $HOME/.gitconfig ] && [ "$(readlink $HOME/.gitconfig)" = "$HOME/main/workspace/dotfiles/gitconfig" ];
then
    :
else
	mv $HOME/.gitconfig $HOME/archive/dotfiles/gitconfig_$HOSTNAME_$(date +%Y%m%d)
fi

# Backup zshrc
if [ -L $HOME/.zshrc ] && [ "$(readlink $HOME/.zshrc)" = "$HOME/main/workspace/dotfiles/zshrc" ];
then
    :
else
	mv $HOME/.zshrc $HOME/archive/dotfiles/zshrc_$HOSTNAME_$(date +%Y%m%d)
fi

# Backup oci_cli_rc
if [ -L $HOME/.oci/oci_cli_rc ] && [ "$(readlink $HOME/.oci/oci_cli_rc)" = "$HOME/main/workspace/dotfiles/oci_cli_rc" ];
then
    :
else
	mv $HOME/.oci/oci_cli_rc $HOME/archive/dotfiles/oci_cli_rc_$HOSTNAME_$(date +%Y%m%d)
fi

# Alert .vim has more than one folder


###
# Set up soft links to configs
###
echo "Setup sym links to dotfiles (if required)..."

# vimrc
if [ -L $HOME/.vimrc ] && [ "$(readlink $HOME/.vimrc)" = "$HOME/main/workspace/dotfiles/.vimrc" ];
then
	echo ".vimrc sym link exists already"
else
	ln -s $HOME/main/workspace/dotfiles/.vimrc $HOME/.vimrc
fi

# neovim init.vim
if [ -L $HOME/.config/nvim/init.vim ] && [ "$(readlink $HOME/.config/nvim/init.vim)" = "$HOME/main/workspace/dotfiles/init.vim" ];
then
	echo "neovim init.vim sym link exists already"
else
	ln -s $HOME/main/workspace/dotfiles/init.vim $HOME/.config/nvim/init.vim
fi

# screenrc
if [ -L $HOME/.screenrc ] && [ "$(readlink $HOME/.screenrc)" = "$HOME/main/workspace/dotfiles/.screenrc" ];
then
	echo ".screenrc sym link exists already"
else
	ln -s $HOME/main/workspace/dotfiles/.screenrc $HOME/.screenrc
fi

# bash_aliases
if [ -L $HOME/.bash_aliases ] && [ "$(readlink $HOME/.bash_aliases)" = "$HOME/main/workspace/dotfiles/bash_aliases" ];
then
echo ".bash_aliases sym link exists already"
else
	ln -s $HOME/main/workspace/dotfiles/bash_aliases $HOME/.bash_aliases
fi

# gvimrc
if [ -L $HOME/.gvimrc ] && [ "$(readlink $HOME/.gvimrc)" = "$HOME/main/workspace/dotfiles/gvimrc" ];
then
echo ".gvimrc sym link exists already"
else
	ln -s $HOME/main/workspace/dotfiles/gvimrc $HOME/.gvimrc
fi


# tmux.conf
if [ -L $HOME/.tmux.conf ] && [ "$(readlink $HOME/.tmux.conf)" = "$HOME/main/workspace/dotfiles/tmux.conf" ];
then
echo ".tmux.conf sym link exists already"
else
	ln -s $HOME/main/workspace/dotfiles/tmux.conf $HOME/.tmux.conf
fi

# gitconfig
if [ -L $HOME/.gitconfig ] && [ "$(readlink $HOME/.gitconfig)" = "$HOME/main/workspace/dotfiles/gitconfig" ];
then
echo ".gitconfig sym link exists already"
else
    ln -s $HOME/main/workspace/dotfiles/gitconfig $HOME/.gitconfig
fi

# zshrc
if [ -L $HOME/.zshrc ] && [ "$(readlink $HOME/.zshrc)" = "$HOME/main/workspace/dotfiles/zshrc" ];
then
echo ".zshrc sym link exists already"
else
    ln -s $HOME/main/workspace/dotfiles/zshrc $HOME/.zshrc
fi

# oci_cli_rc
if [ -L $HOME/.oci/oci_cli_rc ] && [ "$(readlink $HOME/.oci/oci_cli_rc)" = "$HOME/main/workspace/dotfiles/oci_cli_rc" ];
then
echo "oci_cli_rc sym link exists already"
else
    ln -s $HOME/main/workspace/dotfiles/oci_cli_rc $HOME/.oci/oci_cli_rc
fi
