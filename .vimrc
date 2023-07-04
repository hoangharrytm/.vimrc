call plug#begin('~/.vim/plugged')
Plug 'https://github.com/preservim/nerdtree'
Plug 'morhetz/gruvbox'

" Plugins for Angular & JS/TS development

" Plugins for Java development

" Plugin for Docker
call plug#end()

:colorscheme gruvbox
:set background=dark
:set autoindent
:set ma
" Specify tabstop & shiftwidth to get indent = 2 spaces or 4 spaces
:set tabstop=4
:set shiftwidth=4

:set splitright "when split vertically it will automatically split on the right
:set splitbelow "when split horizontally it will pop up below

:set smarttab
:set backspace=2
:set softtabstop=2
:set textwidth=79
:set expandtab
:set fileformat=unix
:set number
:set encoding=utf-8

:set mouse=a
:set visualbell
:set t_vb=

syntax on
nmap <silent> <c-k> :wincmd k<CR>
nmap <silent> <c-j> :wincmd j<CR>
nmap <silent> <c-h> :wincmd h<CR>
nmap <silent> <c-l> :wincmd l<CR>
:set nocompatible
filetype indent on

"press <space>t to open/close nerdtree
"press m to bring up selection menu (add file, delete file, ...)
nnoremap <silent> <expr> <space>t g:NERDTree.IsOpen() ? "\:NERDTreeClose<CR>" : bufexists(expand('%')) ? "\:NERDTreeFind<CR>" : "\:NERDTree<CR>"
