colorscheme ir_black

syntax on             " Enable syntax highlighting
filetype on           " Enable filetype detection
filetype indent on    " Enable filetype-specific indenting
filetype plugin on    " Enable filetype-specific plugins

runtime macros/matchit.vim

let mapleader = ","

set expandtab
retab
set tabstop=2
set shiftwidth=2
set ignorecase
set smartcase
set smartindent
set autoindent
set list
set listchars=trail:·
set scrolloff=3
set hidden
set nostartofline
set backupdir=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set directory=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set statusline=%<%f\ %h%m%r%=%t\ \|\ %-14.(%l,%c%V%)\ %P
set laststatus=2
set ruler
set t_Co=256
set guioptions=
set history=1000
set nowrap
" au WinLeave * set nocursorline
" au WinEnter * set cursorline
set cursorline
set autowrite
set visualbell

map <D-r> :!ruby %<CR>
map! <D-r> :!ruby %<CR>

map <D-1> :tabn 1<CR>
map <D-2> :tabn 2<CR>
map <D-3> :tabn 3<CR>
map <D-4> :tabn 4<CR>
map <D-5> :tabn 5<CR>
map <D-6> :tabn 6<CR>
map <D-7> :tabn 7<CR>
map <D-8> :tabn 8<CR>
map <D-9> :tabn 9<CR>

map! <D-1> <C-O>:tabn 1<CR>
map! <D-2> <C-O>:tabn 2<CR>
map! <D-3> <C-O>:tabn 3<CR>
map! <D-4> <C-O>:tabn 4<CR>
map! <D-5> <C-O>:tabn 5<CR>
map! <D-6> <C-O>:tabn 6<CR>
map! <D-7> <C-O>:tabn 7<CR>
map! <D-8> <C-O>:tabn 8<CR>
map! <D-9> <C-O>:tabn 9<CR>

nmap <leader>bc :Bclose<CR>
nmap <leader>bc! :Bclose!<CR>

map <leader>a :Ack 

set guifont=Inconsolata:h12
"set guifont=:h13


set hlsearch
set incsearch " ...dynamically as they are typed.

" Intuitive backspacing in insert mode
set backspace=indent,eol,start

set listchars=tab:>-,trail:·,eol:$
nmap <silent> <leader>s :set nolist!<CR>

:set nolist!

" Save without sudoing originally
command! -bar -nargs=0 SudoW :silent exe “write !sudo tee % >/dev/null” | silent edit!

let NERDSpaceDelims = "2"
let NERDDefaultNesting = "0"

let g:CommandTMaxHeight= "30"

source ~/.vimrc.local


