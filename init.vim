" # ===============================================================
" # File:                 $HOME/.config/nvim/init.vim
" # Purpose:              Setup file for program neovim
" # Compiled by:          David Lieu
" # ===============================================================


" INSTALL PLUGINS
" ===============
" Specify a directory for plugins
" - For Neovim: stdpath('data') . '/plugged'
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.vim/plugged')

Plug 'kien/ctrlp.vim'
Plug 'majutsushi/tagbar'
Plug 'Valloric/YouCompleteMe'
Plug 'tmhedberg/SimpylFold'
Plug 'vim-scripts/indentpython.vim'
Plug 'vim-syntastic/syntastic'
Plug 'nvie/vim-flake8'
Plug 'jnurmine/Zenburn'
Plug 'scrooloose/nerdtree'


" Initialize plugin system
call plug#end()

" Run :PlugInstall to install plugins

" SETTINGS
" ========

" true color
" let $NVIM_TUI_ENABLE_TRUE_COLOR=1
set termguicolors

" Color scheme.
color desert

" Enable folding
set foldmethod=indent
set foldlevel=99

" encoding
set encoding=utf-8

" highlight
let python_highlight_all=1
syntax on

" Various settings from an example vimrc
set history=500		" keep 50 lines of command line history
set ruler		" show the cursor position all the time
set showcmd		" display incomplete commands
set incsearch		" do incremental searching
set nu!			" show line numbers

set expandtab		" Old setting from mxn, probably for python to use spaces instead of tabs
set tabstop=4		" Same as above^^
set shiftwidth=4	" ^^

" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
if &t_Co > 2 || has("gui_running")
  syntax on
  set hlsearch
endif

" Clipboard always go to system clipboard?
set clipboard+=unnamedplus

" PLUGINS
" =======

" SimplyFold
" See docstrings for folded code
let g:SimpylFold_docstring_preview=1

" YouCompleteMe
" autocomplete. 
let g:ycm_autoclose_preview_window_after_completion=1
map <leader>g  :YcmCompleter GoToDefinitionElseDeclaration<CR>

" NERDTree
"ignore pyc
let NERDTreeIgnore=['\.pyc$', '\~$'] "ignore files in NERDTree

" SHORTCUTS
" =========
" map leader key
let mapleader = " "

" Quicky (ev) edit vimrc or (sv) source
nnoremap <leader>ev :split $MYVIMRC<CR>
nnoremap <leader>sv :source $MYVIMRC<CR>

" window split navigations. Ctrl+W, {J,K,L,H}
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" Enable folding with the spacebar
nnoremap <space> za

" use F6 to toggle NERDTree
nmap <F6> :NERDTreeToggle<CR>

" use F8 to toggle TagBar
nmap <F8> :TagbarToggle<CR>

