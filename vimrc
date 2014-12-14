" Display line numbers on the left
set number
" Identation
set smartindent
set tabstop=4
set shiftwidth=4
set expandtab
" pathogen (manage plugins)
execute pathogen#infect

syntax enable
filetype plugin indent on
let mapleader=","

set background=light
colorscheme solarized
" NERDTree mapping
map <F2> :NERDTreeToggle<cr>
