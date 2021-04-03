" Author: @theniceboy:

" # Neovim (~ / .local / share / nvim / site / autoload) 
" curl -fLo ~ /.local/share/nvim/site/autoload/plug.vim --create-dirs \
"     https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
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

if ! filereadable(expand('~/.local/share/nvim/site/autoload/plug.vim'))
    echo "Download junegunn/vim-plug to manage plugins..."
    silent !mkdir -p ~/.local/share/nvim/site/autoload/
    silent !curl "https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim" > ~/.local/share/nvim/site/autoload/plug.vim
    silent !git clone https://github.com/VundleVim/Vundle.vim.git ~/.config/nvim/bundle/Vundle.vim
endif

set nocompatible              " be iMproved, required
filetype off                  " required
" set the runtime path to include Vundle and initialize
set rtp+=~/.config/nvim/bundle/Vundle.vim
call vundle#begin('~/.config/nvim/bundle')
" alternatively, pass a path where Vundle should install plugins
  
" All of your Plugins must be added before the following line
  
"mover
"<A-k>   Move current line/selection up
"<A-j>   Move curnret line/selection down
"<A-h>   Move current character/selection left
"<A-l>   Move current character/selection right
Plugin 'matze/vim-move'
  
call vundle#end()     

call plug#begin('~/.config/nvim/plugged')

   " Make sure you use single quotes

   " Shorthand notation; fetches https://github.com/junegunn/vim-easy-align
   Plug 'junegunn/vim-easy-align'

   " Any valid git URL is allowed
   Plug 'https://github.com/junegunn/vim-github-dashboard.git'

   " On-demand loading
   Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
   Plug 'tpope/vim-fireplace', { 'for': 'clojure' }

   " Using a non-default branch
   Plug 'rdnetto/YCM-Generator', { 'branch': 'stable' }

   " Using a tagged release; wildcard allowed (requires git 1.9.2 or above)
   Plug 'fatih/vim-go', { 'tag': '*' }

   " Plugin options
   Plug 'nsf/gocode', { 'tag': 'v.20150303', 'rtp': 'vim' }

   " Plugin outside ~/.vim/plugged with post-update hook
   Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }       

   " Unmanaged plugin (manually installed and updated)
   Plug '~/my-prototype-plugin'

   " Initialize plugin system
   " call PlugInstall to install new plugins
   
   "Barra de ayuda de nvim y temas
   Plug 'vim-airline/vim-airline'
   Plug 'vim-airline/vim-airline-themes'
   
call plug#end()

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

" Theme
let g:airline_theme = 'atomic'                            
let g:airline#extensions#tabline#enabled = 1              
let g:airline#extensions#tabline#left_sep = ' '           
let g:airline#extensions#tabline#left_alt_sep = '|'       
let g:airline#extensions#tabline#formatter = 'unique_tail'
syntax enable
let $NVIM_TUI_ENABLE_TRUE_COLOR=1
set termguicolors
set background=dark
" colorscheme nova
  
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
