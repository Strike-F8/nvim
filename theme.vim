" All the pretty colors go here

" colors!!!
colo molokai
syntax on

" highlight 80th and 100th column so that I don't go past them
" https://vi.stackexchange.com/questions/356/how-can-i-set-up-a-ruler-at-a-specific-column
highlight ColorColumn ctermbg=NONE guibg=#5c4b2a
call matchadd('ColorColumn', '¥(¥%80v¥|¥%100v¥)')

" highlight closing bracket for tags
set matchpairs+=<:>

" Support for .ejs files
au BufNewFile,BufRead *.ejs set filetype=html.js

" Make the cursor white with black text
highlight Cursor guifg=black guibg=white
highlight iCursor guifg=black guibg=white

highlight MatchParen guibg=#444444 guifg=white gui=bold

set guicursor=n-v-c:block,i:ver25-iCursor,r-cr:hor20
