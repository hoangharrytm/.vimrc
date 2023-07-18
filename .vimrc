call plug#begin('~/.vim/plugged')

    " Autocompletion plugins
    function! BuildYCM(info)
        if a:info.status == 'installed' || a:info.force
            !./install.py
        endif
    endfunction
    Plug 'ycm-core/YouCompleteMe', { 'do': function('BuildYCM') }
    Plug 'neoclide/coc.nvim', {'branch': 'release'}
    "Plug 'OmniSharp/omnisharp-vim'

    Plug 'https://github.com/preservim/nerdtree'
    Plug 'morhetz/gruvbox'

    " Plugins for Angular & JS/TS development
    Plug 'pangloss/vim-javascript'    " JavaScript support
    Plug 'leafgarland/typescript-vim' " TypeScript syntax
    Plug 'maxmellon/vim-jsx-pretty'   " JS and JSX syntax

    " " Plugins for C# development
    " Plug 'jlcrochet/vim-cs'           " C# syntax highlighting
    " Plug 'jlcrochet/vim-razor'        " cshtml syntax supporting

    " " Plugin for ReactJS
    " Plug 'dense-analysis/ale'
    " Plug 'HerringtonDarkholme/yats.vim'

    " " Plugin for Ruby on Rails
    " Plug 'tpope/vim-rails'
    " Plug 'MarcWeber/vim-addon-mw-utils' " Dependency for Vim snipmate
    " Plug 'tomtom/tlib_vim'
    " Plug 'garbas/vim-snipmate'

    " Plugin for commenting code
    Plug 'tpope/vim-commentary'

    " Plugin for file icon
    Plug 'ryanoasis/vim-devicons'

    " Auto Pairs plugin
    Plug 'jiangmiao/auto-pairs'

    " Plugin for markdown preview
    Plug 'shime/vim-livedown'

    " Vim airline
    Plug 'vim-airline/vim-airline'

    " Plugin for front-end dev
    Plug 'AndrewRadev/tagalong.vim'
    Plug 'alvan/vim-closetag'

    " Plug 'dense-analysis/ale'
    Plug 'styled-components/vim-styled-components' " for reactjs components

call plug#end()
filetype plugin indent on

" let g:ale_fixers = {
" \   '*': ['remove_trailing_lines', 'trim_whitespace'],
" \   'javascript': ['eslint', 'prettier'],
" \   'cs':['syntax', 'semantic', 'issues'],
" \   'python': ['pylint'],
" \   'java': ['javac']
" \}
" " Set this variable to 1 to fix files when you save them.
" let g:ale_fix_on_save = 1

" nmap <space>p :LivedownToggle<CR>
nmap <space>P :CocCommand markdown-preview-enhanced.openPreview<CR>
nmap <space>S :CocCommand markdown-preview-enhanced.syncPreview<CR>

"let g:OmniSharp_server_use_mono = 1
" let g:snipMate = { 'snippet_version' : 1 }

""" GENERAL CONFIG FOR VIM
:colorscheme gruvbox
:set background=dark
:set autoindent
:set cindent
:set smartindent
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
:set termencoding=utf-8
:set mouse=a
:set ttymouse=sgr
:set visualbell
:set t_vb=
:set nocompatible

:set noswapfile
:set nobackup
:set nowritebackup

:set relativenumber
:set ruler

:set foldmethod=syntax
:set foldlevel=99
nmap z za

:set backspace=indent,eol,start
let NERDTreeShowHidden=1

syntax on
filetype indent on
nmap <silent> <c-k> :wincmd k<CR>
nmap <silent> <c-j> :wincmd j<CR>
nmap <silent> <c-h> :wincmd h<CR>
nmap <silent> <c-l> :wincmd l<CR>

"press <space>t to open/close nerdtree
"press m to bring up selection menu (add file, delete file, ...)
nnoremap <silent> <expr> <space>t g:NERDTree.IsOpen() ? "\:NERDTreeClose<CR>" : bufexists(expand('%')) ? "\:NERDTreeFind<CR>" : "\:NERDTree<CR>"

""" COC SERVER CONFIG
" CoC extensions
let g:coc_global_extensions = ['coc-tsserver', 'coc-json', 'coc-css', 'coc-html']

" Add CoC Prettier if prettier is installed
if isdirectory('./node_modules') && isdirectory('./node_modules/prettier')
  let g:coc_global_extensions += ['coc-prettier']
endif

" Add CoC ESLint if ESLint is installed
if isdirectory('./node_modules') && isdirectory('./node_modules/eslint')
  let g:coc_global_extensions += ['coc-eslint']
endif
" Having longer updatetime (default is 4000 ms = 4s) leads to noticeable
" delays and poor user experience
set updatetime=100

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved
set signcolumn=yes

"""""" config for coc
"" Use tab for trigger completion with characters ahead and navigate
" NOTE: There's always complete item selected by default, you may want to enable
" no select by `"suggest.noselect": true` in your configuration file
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config
inoremap <silent><expr> <TAB>
      \ coc#pum#visible() ? coc#pum#next(1) :
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"

" Make <CR> to accept selected completion item or notify coc.nvim to format
" <C-g>u breaks current undo, please make your own choice
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Remap keys for applying codeAction to the current buffer.
nmap <leader>c  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf <Plug>(coc-fix-current)

" Use K to show documentation in preview window
nnoremap <silent> K :call ShowDocumentation()<CR>
nmap <leader>f   :CocCommand prettier.formatFile<CR>

" Fix syntax highlight for Coc plugin floating errors
hi CocErrorFloat guifg=Magenta guibg=Magenta

function! ShowDocumentation()
  if CocAction('hasProvider', 'hover')
    call CocActionAsync('doHover')
  else
    call feedkeys('K', 'in')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s)
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Applying code actions to the selected code block
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap keys for applying code actions at the cursor position
nmap <leader>ac  <Plug>(coc-codeaction-cursor)
" Remap keys for apply code actions affect whole buffer
nmap <leader>as  <Plug>(coc-codeaction-source)
" Apply the most preferred quickfix action to fix diagnostic on the current line
nmap <leader>qf  <Plug>(coc-fix-current)

" Remap keys for applying refactor code actions
nmap <silent> <leader>re <Plug>(coc-codeaction-refactor)
xmap <silent> <leader>r  <Plug>(coc-codeaction-refactor-selected)
nmap <silent> <leader>r  <Plug>(coc-codeaction-refactor-selected)

" Run the Code Lens action on the current line
nmap <leader>cl  <Plug>(coc-codelens-action)

" Map function and class text objects
" NOTE: Requires 'textDocument.documentSymbol' support from the language server
xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)

" Remap <C-f> and <C-b> to scroll float windows/popups
if has('nvim-0.4.0') || has('patch-8.2.0750')
  nnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  nnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
  inoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
  inoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
  vnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  vnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
endif

" Use CTRL-S for selections ranges
" Requires 'textDocument/selectionRange' support of language server
nmap <silent> <C-s> <Plug>(coc-range-select)
xmap <silent> <C-s> <Plug>(coc-range-select)

" Mappings for CoCList
" Show all diagnostics
nnoremap <silent><nowait> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions
nnoremap <silent><nowait> <space>e  :<C-u>CocList extensions<cr>
" Show commands
nnoremap <silent><nowait> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document
nnoremap <silent><nowait> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols
nnoremap <silent><nowait> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item
nnoremap <silent><nowait> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item
nnoremap <silent><nowait> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list
nnoremap <silent><nowait> <space>p  :<C-u>CocListResume<CR>
