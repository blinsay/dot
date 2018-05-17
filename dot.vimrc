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

" Leader
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

" ALE
let g:ale_linters = {
\   'go': ['go build', 'gofmt', 'govet'],
\}
let g:ale_pattern_options = {
\ '\.min\.js$': {'ale_linters': [], 'ale_fixers': []},
\ '\.min\.css$': {'ale_linters': [], 'ale_fixers': []},
\}
nmap <leader><F2> <Plug>(ale_next_wrap)
nmap <leader><F3> <Plug>(ale_detail)

" Clojure
au FileType clojure nnoremap <leader>r :Require<cr>

" Fugitive
nnoremap <leader>gst :Gstatus<cr>
nnoremap <leader>gd :Gdiff

" Go
let g:go_fmt_command = "goimports"
au FileType go nmap <leader>d <Plug>(go-def)
au FileType go nmap <leader>sd <Plug>(go-def-split)
au FileType go nmap <leader>vd <Plug>(go-def-vertical)
au FileType go nmap <leader>j <Plug>(go-doc)

" Elm
let g:elm_format_autosave = 1

" Pythong
au FileType python setl tabstop=4 shiftwidth=4 softtabstop=4

" Ruby
let g:syntastic_ruby_mri_exec='/usr/local/opt/rbenv/shims/ruby'

"RMD neckbeardery
nnoremap <leader>rmd :!Rscript -e 'library(knitr); knit2html("%")'

" Rust
let g:racer_experimental_completer = 1
au FileType rust nmap <leader>d <Plug>(rust-def)
au FileType rust nmap <leader>j <Plug>(rust-doc)

" Typescript
let g:tsuquyomi_disable_default_mappings = 1
let g:tsuquyomi_completion_detail = 1
au FileType typescript nmap <leader>d <Plug>(TsuquyomiDefinition)
