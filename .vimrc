call plug#begin('~/.vim/plugged')

" Autocompletion plugins
function! BuildYCM(info)
    if a:info.status == 'installed' || a:info.force
        !./install.py
    endif
endfunction
Plug 'ycm-core/YouCompleteMe', { 'do': function('BuildYCM') }
"Plug 'OmniSharp/omnisharp-vim'

Plug 'https://github.com/preservim/nerdtree'
Plug 'morhetz/gruvbox'

" Plugins for Angular & JS/TS development
Plug 'pangloss/vim-javascript'    " JavaScript support
Plug 'leafgarland/typescript-vim' " TypeScript syntax
Plug 'maxmellon/vim-jsx-pretty'   " JS and JSX syntax

" Plugins for C# development
Plug 'jlcrochet/vim-cs'           " C# syntax highlighting
Plug 'jlcrochet/vim-razor'        " cshtml syntax supporting 

" Plugin for Docker

" Plugin for Ruby on Rails
Plug 'tpope/vim-rails'
Plug 'MarcWeber/vim-addon-mw-utils' " Dependency for Vim snipmate
Plug 'tomtom/tlib_vim'
Plug 'garbas/vim-snipmate'

" Plugin for commenting code
Plug 'tpope/vim-commentary'

" Plugin for file icon
Plug 'ryanoasis/vim-devicons'
call plug#end()

"let g:OmniSharp_server_use_mono = 1
let g:snipMate = { 'snippet_version' : 1 }

""" GENERAL CONFIG FOR VIM
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
:set ttymouse=sgr 
:set visualbell
:set t_vb=
:set nocompatible
:set noswapfile
syntax on
filetype indent on
nmap <silent> <c-k> :wincmd k<CR>
nmap <silent> <c-j> :wincmd j<CR>
nmap <silent> <c-h> :wincmd h<CR>
nmap <silent> <c-l> :wincmd l<CR>

"press <space>t to open/close nerdtree
"press m to bring up selection menu (add file, delete file, ...)
nnoremap <silent> <expr> <space>t g:NERDTree.IsOpen() ? "\:NERDTreeClose<CR>" : bufexists(expand('%')) ? "\:NERDTreeFind<CR>" : "\:NERDTree<CR>"
nnoremap <space>f :YcmCompleter FixIt<CR>
