" Author: @JIN26:
"
" # Neovim (~ / .config / nvim / bundle / Vundle.vim) 
" git clone https://github.com/VundleVim/Vundle.vim.git ~/.config/nvim/bundle/Vundle.vim
"
" To ignore plugin indent changes, instead use:
" filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

set nocompatible              " be iMproved, required
filetype off                  " required
" set the runtime path to include Vundle and initialize
set rtp+=~/.config/nvim/bundle/Vundle.vim

call vundle#begin('~/.config/nvim/bundle')
" Alternatively, pass a path where Vundle should install plugins
" All of your Plugins must be added before the following line

" Initialize plugin system
" call PlugInstall to install new plugins

    " let Vundle manage Vundle, required
    Plugin 'VundleVim/Vundle.vim'

    " mover
    " <A-k>   Move current line/selection up
    " <A-j>   Move curnret line/selection down
    " <A-h>   Move current character/selection left
    " <A-l>   Move current character/selection right
    Plugin 'matze/vim-move'
  
    " Any valid git URL is allowed
    Plugin 'https://github.com/junegunn/vim-github-dashboard.git'

    " status of git in vim
    Plugin 'jreybert/vimagit'
    Plugin 'tpope/vim-fugitive'
    Plugin 'airblade/vim-gitgutter'

    " On-demand loading
    Plugin 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
    Plugin 'tpope/vim-fireplace', { 'for': 'clojure' }


    "Barra de ayuda de nvim y temas
    Plugin 'vim-airline/vim-airline'
    Plugin 'vim-airline/vim-airline-themes'
    
    " coc autocomplete
    Plugin 'neoclide/coc.nvim', {'branch': 'release' }

call vundle#end()     

" basics
filetype plugin indent on
syntax on set number
set number
set cursorcolumn
set shiftwidth=4

" preferences

map <F2> :terminal<CR>
inoremap jk <ESC>
let mapleader = "\<Space>"

" plugin settings

" Theme https://github.com/vim-airline/vim-airline/wiki/Screenshots
let g:airline_theme = 'atomic' 
let g:airline#extensions#branch#enabled = 1              
let g:airline#extensions#tabline#enabled = 1              
let g:airline#extensions#tabline#left_sep = ' '           
let g:airline#extensions#tabline#left_alt_sep = '|'       
let g:airline#extensions#tabline#formatter = 'unique_tail'
syntax enable
let $NVIM_TUI_ENABLE_TRUE_COLOR=1
set termguicolors
set background=dark
  
" NERDTree
" How can I close vim if the only window left open is a NERDTree?
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
" toggle NERDTree
map <C-n> :NERDTreeToggle<CR>
let g:NERDTreeChDirMode=2
let g:NERDTreeIgnore=['\.rbc$', '\~$', '\.pyc$', '\.db$', '\.sqlite$', '__pycache__', 'node_modules']
let g:NERDTreeSortOrder=['^__\.py$', '\/$', '*', '\.swp$', '\.bak$', '\~$']
let g:NERDTreeShowBookmarks=1
let g:nerdtree_tabs_focus_on_files=1
let g:NERDTreeMapOpenInTabSilent = '<RightMouse>'
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*.pyc,*.db,*.sqlite
  
" jsx
let g:jsx_ext_required = 0
