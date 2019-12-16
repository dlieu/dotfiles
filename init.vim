" # ===============================================================
" # File:                 $HOME/.config/nvim/init.vim
" # Purpose:              Setup file for program neovim
" # Compiled by:          David Lieu
" # ===============================================================


" Specify a directory for plugins
" - For Neovim: stdpath('data') . '/plugged'
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.vim/plugged')

Plug 'ctrlpvim/ctrlp.vim'
Plug 'majutsushi/tagbar'

" Initialize plugin system
call plug#end()

" Run :PlugInstall to install plugins



" Various settings from an example vimrc
set history=500		" keep 50 lines of command line history
set ruler		" show the cursor position all the time
set showcmd		" display incomplete commands
set incsearch		" do incremental searching
set nu!			" show line numbers

set expandtab		" Old setting from mxn, probably for python to use spaces instead of tabs
set tabstop=4		" Same as above^^
set shiftwidth=4	" ^^

" true color
" let $NVIM_TUI_ENABLE_TRUE_COLOR=1
set termguicolors

" Color scheme.
color desert
