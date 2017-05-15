execute pathogen#infect()
syntax on
set spell spelllang=en_gb
filetype plugin indent on

" Search
set incsearch
set ignorecase smartcase

" Indenting
set expandtab
set shiftwidth=2
set softtabstop=2

" Syntax help
set omnifunc=syntaxcomplete#Complete

" Line length marker for git commits
autocmd Filetype gitcommit setlocal spell textwidth=72

" Allow saving of files as sudo when I forgot to start vim using sudo.
cmap w!! w !sudo tee > /dev/null 

" Enable powerline
python from powerline.vim import setup as powerline_setup
python powerline_setup()
python del powerline_setup


" Enable truecolours
set termguicolors
