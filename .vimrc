" load plugins
execute pathogen#infect()
call pathogen#helptags()
syntax on

set nocompatible
filetype off

filetype plugin indent on

" Settings
"
set noerrorbells                " No beeps
set number                      " Show line numbers
set backspace=indent,eol,start  " Makes backspace key more powerful.
set showcmd                     " Show me what I'm typing
set showmode                    " Show current mode.

set noshowmode                  " We show the mode with airline or lightline
set autoindent

set splitright
set splitbelow

set incsearch
set hlsearch

set ruler                       " Show the cursor position all the time
set tabstop=4

set showmatch

set nobackup
set noswapfile

set encoding=utf-8

set clipboard=unnamed

set background=dark
let g:solarized_termcolors=256
let g:solarized_termtrans=1
colorscheme solarized

let mapleader = ","
let g:mapleader = ","

" ------------------ "
" File Type settings "
" ------------------ "
au BufNewFile,BufRead *.vim setlocal noet ts=4 sw=4 sts=4
au BufNewFile,BufRead *.md setlocal spell noet ts=4 sw=4
au BufNewFile,BufRead *.yml,*.yaml setlocal expandtab ts=2 sw=2
au BufNewFile,BufReadPost *.md set filetype=markdown

" python indent
autocmd BufNewFile,BufRead *.py setlocal tabstop=4 softtabstop=4 shiftwidth=4 textwidth=80 smarttab expandtab

"==================== NerdTree ====================
"" For toggling
nmap <C-n> :NERDTreeToggle<cr>
noremap <leader>n :NERDTreeToggle<cr>
noremap <leader>f :NERDTreeFind<cr>

" Quickly edit/reload the vimrc file
nmap <silent> <leader>ev :e $MYVIMRC<cr>
nmap <silent> <leader>sv :so $MYVIMRC<cr>

let NERDTreeShowHidden=1

let NERDTreeIgnore=['\.vim$', '\~$', '\.git$', '.DS_Store']

" Close nerdtree and vim on close file
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") &&  b:NERDTreeType == "primary") | q | endif

" =================== vim-airline ========================
set laststatus=2

let g:airline_theme='solarized'
let g:airline_powerline_fonts=1

" set to use powerline fonts when not in a ssh session
let g:remoteSession = ($STY == "")
if !g:remoteSession
    let g:airline_powerline_fonts=1
endif

" Strip trailing whitespace (,ss)
function! StripWhitespace()
    let save_cursor = getpos(".")
    let old_query = getreg('/')
    :%s/\s\+$//e
    call setpos('.', save_cursor)
    call setreg('/', old_query)
endfunction
noremap <leader>ss :call StripWhitespace()<CR>

