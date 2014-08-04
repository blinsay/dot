" Basics
execute pathogen#infect()
syntax on
filetype plugin indent on

" LEEDER
let mapleader = ","
nnoremap <leader>q gqip
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
noremap gq <leader>q

" Compatibility
set nocompatible
set modelines=0

" Colors/Visibility
set background=dark
colorscheme solarized
set scrolloff=5

" UI
set wildmenu

" Search
nnoremap / /\v
vnoremap / /\v
set incsearch hlsearch
set gdefault
set showmatch
nnoremap <leader><space> :noh<cr>

" Indents/tabs
set nobackup
set backspace=indent,eol,start
set nostartofline
set ruler
set number
set showcmd
set showmode
set expandtab
set tabstop=2 softtabstop=2 shiftwidth=2 ai
set encoding=utf-8

" Remove all trailing whitespace on write
autocmd BufWritePre * :%s/\s\+$//e

"find/replace selected text in Visual mode
vnoremap <C-r> "hy:%s/<C-r>h//gc<left><left><left>

" PYTHON IS PEP8
au FileType python setl tabstop=4 shiftwidth=4 softtabstop=4 
