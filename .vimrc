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

autocmd Filetype gitcommit setlocal spell textwidth=72

" Allow saving of files as sudo when I forgot to start vim using sudo.
cmap w!! w !sudo tee > /dev/null 
