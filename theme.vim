" All the pretty colors go here

" colors!!!
colo molokai
syntax on

" highlight 80th and 100th column so that I don't go past it
" https://vi.stackexchange.com/questions/356/how-can-i-set-up-a-ruler-at-a-specific-column
highlight ColorColumn ctermbg=white guibg=white
call matchadd('ColorColumn', '\(\%80v\|\%100v\)')

" highlight closing bracket for tags
set matchpairs+=<:>

" Enable spell checker
set spell

" Support for .ejs files
au BufNewFile,BufRead *.ejs set filetype=html.js
