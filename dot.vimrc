" ------------------------------------------------------------------------------
" Basics

execute pathogen#infect()
syntax on
filetype plugin indent on

" Compatibility
set nocompatible
set modelines=0

" Colors/Visibility
set background=dark
colorscheme solarized
set scrolloff=10

" UI
set wildmenu

" Leader Shenanigans
let mapleader = ","

" Disable Arrow Keys
nnoremap <up> <nop>
nnoremap <down> <nop>
nnoremap <left> <nop>
nnoremap <right> <nop>
inoremap <up> <nop>
inoremap <down> <nop>
inoremap <left> <nop>
inoremap <right> <nop>
nnoremap j gj
nnoremap k gk

" Disable help key
inoremap <F1> <ESC>
vnoremap <F1> <ESC>
nnoremap <F1> <ESC>

" ------------------------------------------------------------------------------
" Formatting

" Character gutter
set colorcolumn=81

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

"RMD neckbeardery
nnoremap <leader>rmd :!Rscript -e 'library(knitr); knit2html("%")'

" ------------------------------------------------------------------------------
" Windows and splits

" Movement
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" New splits
noremap <leader>w <C-w>v<C-w>l

" ------------------------------------------------------------------------------
" Shortcuts

" Quick esc
inoremap jj <ESC>

" System clipboard
nnoremap <leader>y "*y
vnoremap <leader>y "*y
nnoremap <leader>p "*p
vnoremap <leader>p "*p

" Format text
nnoremap <leader>q gqip
noremap gq <leader>q

" Search
nnoremap / /\v
vnoremap / /\v
set incsearch hlsearch
set gdefault
set showmatch
nnoremap <leader><space> :noh<cr>
nnoremap <leader>a :Ag<space>

" Fugitive
nnoremap <leader>gst :Gstatus<cr>
nnoremap <leader>gd :Gdiff

" Syntastic
nnoremap <leader>C :SyntasticToggleMode<cr>

" NERDTree
nnoremap <leader>n :NERDTree<cr>

" Go
let g:go_fmt_command = "goimports"
au FileType go nnoremap <leader>d <Plug>(go-def)
au FileType go nnoremap <leader>j <Plug>(go-doc)
au FileType go nnoremap <leader>t <Plug>(go-test)
