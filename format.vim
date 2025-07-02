" Formatting
" ex. tab width

" fully support utf-8
set encoding=utf-8
" Support for various encodings. Neovim should automatically detect the encoding
set fileencodings=ucs-bom,utf-8,sjis,latin1

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
"
" Wrapping options
set formatoptions=tc " Wrap text and comments using textwidth
set formatoptions+=r " Continue comments when pressing ENTER in insert mode
set formatoptions+=q " Enable formatting of comments with qg
set formatoptions+=n " Detect lists for formatting
set formatoptions+=b " Auto-wrap in insert mode, and do not wrap old long lines
