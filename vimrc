set nocompatible        " must be first line
set shell=/bin/zsh
set background=dark     " Assume a dark background
filetype off                   " required!
set history=1000                
if has('vim_starting')
//   set runtimepath+=~/.vim/bundle/neobundle.vim/
 endif

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
 call neobundle#rc(expand('~/.vim/bundle/'))

:set rtp+=/usr/local/bin/ocamlmerlin/vim
set number

Plugin 'gmarik/Vundle.vim'
source ~/dotfiles/vim.bundles
call vundle#end()            " required
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab
let mapleader = ","
let g:syntastic_enable_signs=1
let g:syntastic_auto_jump=1
let g:syntastic_stl_format = '[%E{Err: %fe #%e}%B{, }%W{Warn: %fw #%w}]'
autocmd BufRead,BufNewFile *.es6 setfiletype javascript

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
"let g:syntastic_check_on_wq = 0
"UndotreeToggle
highlight LineNr guifg=grey  
map <Leader>u :UndotreeToggle<CR>

""" Code folding options
nmap <leader>f0 :set foldlevel=0<CR>
nmap <leader>f1 :set foldlevel=1<CR>
nmap <leader>f2 :set foldlevel=2<CR>
nmap <leader>f3 :set foldlevel=3<CR>
nmap <leader>f4 :set foldlevel=4<CR>
nmap <leader>f5 :set foldlevel=5<CR>
nmap <leader>f6 :set foldlevel=6<CR>
nmap <leader>f7 :set foldlevel=7<CR>
nmap <leader>f8 :set foldlevel=8<CR>
nmap <leader>f9 :set foldlevel=9<CR>
syntax on
filetype plugin indent on
let mapleader = ","

set timeoutlen=4000
#set guifont=Inconsolata-dz\ for\ Powerline:h12
set guifont=Inconsolata:h12


" Fugitive
        nnoremap <silent> <leader>gs :Gstatus<CR>
        nnoremap <silent> <leader>gd :Gdiff<CR>
        nnoremap <silent> <leader>gc :Gcommit<CR>
        nnoremap <silent> <leader>gb :Gblame<CR>
        nnoremap <silent> <leader>gl :Glog<CR>
        nnoremap <silent> <leader>gp :Git push<CR>

:let $PATH .='PATH=/usr/local/bin:~/:~/.lein:/usr/local/Cellar/llvm/3.1/bin:/usr/local/Cellar/python/2.7.8_1/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin:/usr/local/git/bin:$HOME/bin'
[[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm"  # This loads RVM into a shell session.

au InsertLeave * hi Cursor guibg=red
au InsertEnter * hi Cursor guibg=white
au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces
au VimEnter hi LineNr guifg=#a3a3a3
set laststatus=2
set ttimeoutlen=50
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'
highlight Pmenu ctermbg=red ctermfg=white
highlight Pmenu guibg=red guifg=white
hilight Pmenu ctermbg=red ctermfg=white
hilight Pmenu guibg=red guifg=white

auto

try
    colorscheme anderson
catch
    colorscheme desert256
endtry

function! OCamlType()
    let col  = col('.')
    let line = line('.')
    let file = expand("%:p:r")
    echo system("annot -n -type ".line." ".col." ".file.".annot")
endfunction    
map <leader>t :call OCamlType()<return>

"absurd command to open a VSplit window with the current code scrolled a page
"ahead
 
:noremap <silent> <Leader>vs :<C-u>let @z=&so<CR>:set so=0 noscb<CR>:bo vs<CR>Ljzt:setl scb<CR><C-w>p:setl scb<CR>:let &so=@z<CR>
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
let g:SuperTabDefaultCompletionType = "<c-n>"
hi LineNr guifg=#a3a3a3
hi Visual  guifg=White guibg=LightBlue
autocmd FileType ocaml source /Users/Tyler/.opam/system/share/typerex/ocp-indent/ocp-indent.vim
set backupdir=./.backup,.,/tmp
set directory=.,./.backup,/tmp

fun! JumpToDef()
  if exists("*GotoDefinition_" . &filetype)
    call GotoDefinition_{&filetype}()
  else
    exe "norm! \<C-]>"
  endif
endf

" Jump to tag
nn <M-g> :call JumpToDef()<cr>
ino <M-g> <esc>:call JumpToDef()<cr>i

