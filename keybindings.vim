" These are my custom keybindings

" Open neovim configuration directory in a new vertical buffer
" Configuration is in a different location depending on OS
" but $MYVIMRC is a variable stored by nvim that always leads to the configuration file
" CTRL-A (back-tick) for Windows and Linux
" F4 for macOS

if system('uname -s') == "Darwin\n"
    "macOS (Not tested yet as I no longer have a mac)
    nnoremap <silent> <F4> :vnew $MYVIMRC/..<cr>
else
    "Windows and Linux
    nnoremap <silent> <C-A> :vnew $MYVIMRC/..<cr>
endif

" Open the directory of the current buffer in a vertical split
nnoremap <silent> . :execute 'vnew ' . expand('%:p:h')<CR>

" Exit terminal with ESC
tnoremap <ESC> <C-\><C-n>

" Exit insert mode with ";asd"
inoremap ;asd <ESC>

" ==========SEARCHING===============
" Ignore case when searching
set ignorecase

" toggle search highlighting with F3
nnoremap <F3> :set hlsearch!<CR>

" Enter command mode with ; rather than :
nnoremap ; :

" Use OS clipboard
set clipboard+=unnamedplus

" Yank from current cursor position to end of line
nnoremap Y y$

" jump to matching pairs with <TAB>
nmap <Tab> %
vmap <Tab> %

" Go to the first character in the line
nmap g8 ^
vmap g8 ^

" Go to the last character in the line
nmap g9 $
vmap g9 $

" Change the current line to title case (Every first letter is capitalized)
" Clear the search register afterwards so that not everything becomes highlighted
nnoremap <silent> gG :s/\v<(.)(\w*)/\u\1\L\2/g <bar> :let @/ = ''<cr>

" ASYNCRUN shortcuts/configuration
" Open Quickfix window at 8 lines height
let g:asyncrun_open = 8

" Ring the bell when AsyncRun is finished
let g:asyncrun_bell = 1

" Get errormarker to process the quickfix window after :make
let g:asyncrun_auto = "make"

" F10 toggle quickfix window
nnoremap <F10> :call asyncrun#quickfix_toggle(6)<cr>

" Buffer switching from normal mode using leader key (\)
" Switch to next buffer
nnoremap <leader>l :bn<CR>
" Switch to previous buffer
nnoremap <leader>j :bp<CR>

" Tab switching using leader key (\)
" Switch to tab 1
nnoremap <leader>1 :tabn 1<CR>
" Switch to tab 2
nnoremap <leader>2 :tabn 2<CR>
" Switch to tab 3
nnoremap <leader>3 :tabn 3<CR>
" Switch to tab 4
nnoremap <leader>4 :tabn 4<CR>
" Switch to tab 5
nnoremap <leader>5 :tabn 5<CR>
" Switch to tab 6
nnoremap <leader>6 :tabn 6<CR>
" Switch to tab 7
nnoremap <leader>7 :tabn 7<CR>
" Switch to tab 8
nnoremap <leader>8 :tabn 8<CR>
" Switch to tab 9
nnoremap <leader>9 :tabn 9<CR>

" Switch to next tab
nnoremap <leader>f :tabnext<CR>
" Switch to previous tab
nnoremap <leader>f :tabprev<CR>

" coc.vim code completion keybindings

" Use <Tab> for completion and snippets
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ CheckBackspace() ? "\<TAB>" :
      \ coc#refresh()
inoremap <silent><expr> <S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~ '\s'
endfunction

" Trigger completion manually with <C-Space>
inoremap <silent><expr> <C-Space> coc#refresh()

" Use `[g` and `]g` to jump diagnostics
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" Go to definition, type definition, implementation
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation
nnoremap <silent> K :call CocActionAsync('doHover')<CR>

" Auto highlight symbol under cursor
autocmd CursorHold * silent call CocActionAsync('highlight')

