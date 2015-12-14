" # ===============================================================
" # File:                 $HOME/.vimrc
" # Purpose:              Setup file for program vim
" # Compiled by:          David Lieu
" # Latest update:        December 14, 2015
" # ===============================================================

" These two were from Vundle setup
set nocompatible              " be iMproved, required
filetype off                  " required

" Vundle - set the runtime path and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" All of your Plugins must be added before the following line
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



" Tagbar Mapping
nmap <F8> :TagbarToggle<CR>

