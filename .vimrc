call plug#begin()

Plug 'morhetz/gruvbox'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'airblade/vim-gitgutter'
Plug 'haishanh/night-owl.vim'
Plug 'itchyny/lightline.vim'

call plug#end()

set nocompatible

filetype plugin indent on


syntax on
colorscheme night-owl
set background=dark
set termguicolors
set noerrorbells
set nowrap
set hidden
set encoding=utf-8
set noswapfile
set nobackup
set nowritebackup
set shortmess+=c
set number
set relativenumber
set mouse=a
set ttyfast
set lazyredraw
set list
set timeoutlen=500
set listchars=trail:~,extends:>,precedes:<
set smartcase
set incsearch
set smartindent
set ignorecase
set splitright
set splitbelow
set showtabline=2
set smarttab
set shiftwidth=2
set softtabstop=2
set tabstop=2
set expandtab
set updatetime=50
set nohlsearch
set clipboard=unnamedplus
set wildignore+=*/node_modules/**
set showcmd
set incsearch
set scrolloff=2
set showmatch
set textwidth=80
"set colorcolumn=+1
"set colorcolumn=120
set updatetime=300

highlight Comment cterm=italic

let mapleader="\<space>"

" airline configuration
"let g:airline_theme='gruvbox'
" let g:airline_powerline_fonts = 1
"let g:airline#extensions#tabline#enabled = 1
" let g:airline#extensions#tabline#tab_min_count = 2
"let g:airline#extensions#tabline#left_sep = ' '
"let g:airline#extensions#tabline#left_alt_sep = '|'
"let g:airline#extensions#tabline#formatter = 'default'

let g:lightline = { 'colorscheme': 'nightowl' }

nmap <silent> <Leader>a :bprev!<Return>
nmap <silent> <Leader>s :bnext!<Return>
nmap <silent> <Leader>d :bd!<Return>
nmap <silent> <Leader>c :noh<Return>
nmap <silent> <Leader>wq :wq!<Return>
nmap <silent> <Leader>q :q!<Return>
nmap <silent> <Leader>w :w<Return>
nmap <silent> <Leader>b gg=G<Return>
nmap <silent> <Leader>qa :qa!<Return>
nmap <silent> <Leader>Q :q!<Return>
nmap <silent> <Leader>q :q!<Return>
nmap <silent> <Leader>r :source ~/.vimrc<Return>
