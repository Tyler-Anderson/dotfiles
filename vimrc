set nocompatible        " must be first line
set shell=/bin/bash
set background=dark     " Assume a dark background
filetype off                   " required!

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()
set number
 " let Vundle manage Vundle
 " required! 
Bundle 'gmarik/vundle'
" My Bundles
Bundle 'tpope/vim-fugitive'
Bundle 'Lokaltog/vim-easymotion'
Bundle 'vim-scripts/Color-Sampler-Pack'
Bundle 'Shougo/neocomplcache'
Bundle 'chriskempson/tomorrow-theme'
Bundle 'kien/ctrlp.vim'
Bundle 'msanders/snipmate.vim'
Bundle 'scrooloose/syntastic'
Bundle 'kchmck/vim-coffee-script'
Bundle 'vim-ruby/vim-ruby'
Bundle 'Lokaltog/vim-easymotion'
Bundle 'pangloss/vim-javascript'
Bundle 'tpope/vim-haml'
Bundle 'vim-scripts/VimClojure'
Bundle 'sjl/gundo.vim'
Bundle 'mattn/zencoding-vim'
Bundle 'vim-scripts/YankRing.vim'
Bundle 'juvenn/mustache.vim'
Bundle 'w0ng/vim-hybrid'
Bundle 'kien/rainbow_parentheses.vim'
Bundle 'chriskempson/tomorrow-theme'
Bundle 'vim-scripts/slimv.vim'
Bundle 'sjl/badwolf'
Bundle 'tpope/vim-repeat'
Bundle 'ZenCoding.vim'
Bundle 'gkz/vim-ls'
Bundle 'groenewege/vim-less.git'
Bundle 'skammer/vim-css-color'
Bundle 'epeli/slimux'

syntax on
filetype plugin indent on
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab

let mapleader = ","
"slimux repl keybindings 
map <Leader>s :SlimuxREPLSendLine<CR>
vmap <Leader>s :SlimuxREPLSendSelection<CR>
map <Leader>a :SlimuxShellLast<CR>
let g:neocomplcache_enable_at_startup = 1 
" Recommended key-mappings. 
" <CR>: close popup and save indent. 
inoremap <expr><CR>  neocomplcache#smart_close_popup() . "\<CR>" 
" <TAB>: completion. 
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>" 
" <C-h>, <BS>: close popup and delete backword char. 
inoremap <expr><C-h> neocomplcache#smart_close_popup()."\<C-h>" 
inoremap <expr><BS> neocomplcache#smart_close_popup()."\<C-h>" 
inoremap <expr><C-y>  neocomplcache#close_popup() 
inoremap <expr><C-e>  neocomplcache#cancel_popup() 
let g:vimclojure#HighlightBuiltins = 1
let g:vimclojure#ParenRainbow = 1
"let g:lisp_rainbow=1
set timeoutlen=4000
set guifont=Inconsolata:h14
colorscheme Desert
g:slimv_swank_cmd = "! osascript -e 'tell application \"Terminal\" to do script \" lein swank &\"'"
:noremap <silent> <Leader>vs :<C-u>let @z=&so<CR>:set so=0 noscb<CR>:bo vs<CR>Ljzt:setl scb<CR><C-w>p:setl scb<CR>:let &so=@z<CR>
