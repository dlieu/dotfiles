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
" Plugin 'majutsushi/tagbar'

" add all your plugins here (note older versions of Vundle
" used Bundle instead of Plugin)
" YouCompleteMe is autocompleter.  requires pre-install before working
Plugin 'Valloric/YouCompleteMe'
Plugin 'tmhedberg/SimpylFold'
Plugin 'vim-scripts/indentpython.vim'
Plugin 'vim-syntastic/syntastic'
Plugin 'nvie/vim-flake8'
Plugin 'jnurmine/Zenburn'
Plugin 'scrooloose/nerdtree'
Plugin 'kien/ctrlp.vim'
Plugin 'Lokaltog/powerline', {'rtp': 'powerline/bindings/vim/'}
Plugin 'vimwiki/vimwiki'
Plugin 'plugin/taglist.vim'

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


" map leader key
let mapleader = " "

" use F6 to toggle nerd tree
nmap <F6> :NERDTreeToggle<CR>

" Taglist configs
" nmap <F8> :TlistToggle<CR>
nnoremap <silent> <F8> :TlistToggle<CR>
let Tlist_GainFocus_On_ToggleOpen = 1
let Tlist_Show_One_file = 1
let Tlist_Compact_Format = 1
" let Tlist_Close_On_Select= 1


" Color scheme.
color desert

" trim white space
" https://vi.stackexchange.com/a/456
" ways to use.  :call TrimWhitespace()  or :TrimWhitespace  or  leader w
fun! TrimWhitespace()
    let l:save = winsaveview()
    keeppatterns %s/\s\+$//e
    call winrestview(l:save)
endfun
command! TrimWhitespace call TrimWhitespace()
noremap <Leader>w :call TrimWhitespace()<CR>
