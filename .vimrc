" # ===============================================================
" # File:                 $HOME/.vimrc
" # Purpose:              Setup file for program vim
" # Compiled by:          David Lieu
" # Latest update:        December 14, 2015
" # ===============================================================

" Use Vim settings, rather than Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible " be iMproved, Vundle required

" For Vundle sake, disable below before initializing.
" turn filetype detection off and, even if it's not strictly
" necessary, disable loading of indent scripts and filetype plugins
filetype off
filetype plugin indent off

" Vundle - set the runtime path and initialize
" Ensure set nocompatible, and filetype off were run first
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" Vundle - Plugins go here
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'majutsushi/tagbar'

call vundle#end()            " required
filetype plugin indent on    " required vundle
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line



" Various settings from an example vimrc
set history=500		" keep 50 lines of command line history
set ruler		" show the cursor position all the time
set showcmd		" display incomplete commands
set incsearch		" do incremental searching



" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
if &t_Co > 2 || has("gui_running")
  syntax on
  set hlsearch
endif



" Tagbar Mapping
nmap <F8> :TagbarToggle<CR>

