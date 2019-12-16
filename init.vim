" # ===============================================================
" # File:                 $HOME/.config/nvim/init.vim
" # Purpose:              Setup file for program neovim
" # Compiled by:          David Lieu
" # ===============================================================


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

"split navigations
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" Enable folding
set foldmethod=indent
set foldlevel=99

" Enable folding with the spacebar
nnoremap <space> za

" See docstrings for folded code
let g:SimpylFold_docstring_preview=1

" encoding
set encoding=utf-8

" autocomplete. 
let g:ycm_autoclose_preview_window_after_completion=1
map <leader>g  :YcmCompleter GoToDefinitionElseDeclaration<CR>

" highlight
let python_highlight_all=1
syntax on

"ignore pyc
let NERDTreeIgnore=['\.pyc$', '\~$'] "ignore files in NERDTree


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



" true color
" let $NVIM_TUI_ENABLE_TRUE_COLOR=1
set termguicolors

" Color scheme.
color desert
