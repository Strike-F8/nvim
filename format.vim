" Formatting
" ex. tab width

" fully support utf-8
set encoding=utf-8
set fileencoding=utf-8

" show line number and relative line number
set number
" tab options
set tabstop=8
set softtabstop=4
set shiftwidth=4

" Automatically insert line break when text reaches 100th column
set textwidth=100

" Indentation for yaml files
autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab
