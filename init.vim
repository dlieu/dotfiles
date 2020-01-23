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

" Fuzzy Finder (fzf). #requires seperate install.
Plug '~/.fzf'
" Fuzzy Finder vim support
Plug 'junegunn/fzf.vim'
" YouCompleteMe - code completion engine
Plug 'Valloric/YouCompleteMe'
" NERDTree - file explorer
Plug 'scrooloose/nerdtree'
" tagbar - class outline viewer
Plug 'majutsushi/tagbar'
" Commentary - Toggle comments
Plug 'tpope/vim-commentary'
" Surround - surround objects with brackets, quotes, tags, etc...
Plug 'tpope/vim-surround'
" Repeat - support '.' repeat on other tim pope plugins.
Plug 'tpope/vim-repeat'
" indentLine - draw lines at indent.  
"   https://vi.stackexchange.com/questions/666/how-to-add-indentation-guides-lines
Plug 'Yggdroot/indentLine'
" SimplyFold - python smart folding
Plug 'tmhedberg/SimpylFold'
" syntastic - python syntax checker
Plug 'vim-syntastic/syntastic'
" black - python black syntax formatter
Plug 'psf/black'

" #ctrlp - fuzzy file, buffer, mru, tag.. finder
" #Plug 'ctrlpvim/ctrlp.vim'
" #indentpython - help indents, should be somewhat smarter with open brackets
" #Plug 'vim-scripts/indentpython.vim'
" #flake8 - python static syntax and style checker. #requires seperate install
" #Plug 'nvie/vim-flake8'
" #Zenburn - color scheme
" #Plug 'jnurmine/Zenburn'


" Initialize plugin system
call plug#end()

" Run :PlugInstall to install plugins

" SETTINGS
" ========

" true color
" let $NVIM_TUI_ENABLE_TRUE_COLOR=1
set termguicolors

" Case insensitive searching
set ignorecase
" set smartcase   " switch to case sensitive if capitals used

" Color scheme.
color desert

" Enable folding
" set foldmethod=indent
" set foldlevel=99

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
set number			" show line numbers
" Expand tabs to 4 spaces
" https://stackoverflow.com/questions/1878974/redefine-tab-as-4-spaces
set expandtab		" expand tabs to space
set tabstop=4		" width of TAB set to 4. still a t
set shiftwidth=4	" indents width of 4

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

" Black
" run on save
autocmd BufWritePre *.py execute ':Black'

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

" Syntastic
" change from py2 to py3
"   https://stackoverflow.com/a/51522537
"   very simple, but not flexible.
let g:syntastic_python_python_exec = 'python3'
let g:syntastic_python_checkers = ['python']

" SHORTCUTS
" =========
" map leader key
let mapleader = " "

" leader sv or ev -  edit vimrc or source
nnoremap <leader>ev :split $MYVIMRC<CR>
nnoremap <leader>sv :source $MYVIMRC<CR>

" Ctrl+{J,K,L,H} - window split navigations
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>


" xxspacebar - Enable folding 
" nnoremap <space> za

" Shift+<UP>/<DOWN>  -  move lines up or down, like sublime.
nnoremap <S-Up> :m-2<CR>
nnoremap <S-Down> :m+<CR>
inoremap <S-Up> <Esc>:m-2<CR>
inoremap <S-Down> <Esc>:m+<CR>

" Ctrl+P - Fuzzy Finder :Files
nnoremap <C-P> :Files<CR>
" Ctrl+K - Fuzzy Finder :Buffers
nnoremap <C-K> :Buffers<CR>
" leader, r - Fuzzy Finder :Tags
nnoremap <leader>r :Tags<CR>


" leader / - toggle Commentary
noremap <leader>/ :Commentary<cr>

" F6 - toggle NERDTree
nmap <F6> :NERDTreeToggle<CR>

" F8 - toggle TagBar
nmap <F8> :TagbarToggle<CR>

