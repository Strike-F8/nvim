" Open neovim configuration directory in a new vertical buffer
" Configuration is in a different location depending on OS
" but $MYVIMRC is a variable stored by nvim that always leads to the configuration file
" CTRL-A for Windows and Linux
" F4 for MacOS

if system('uname -s') == "Darwin\n"
    "MacOS (Not tested yet as I no longer have a mac)
    nnoremap <silent> <F4> :vnew $MYVIMRC/..<cr>
else
    "Windows and Linux
    nnoremap <silent> <C-Z> :vnew $MYVIMRC<cr>
endif

" Open the directory of the current buffer in a vertical split
nnoremap <silent> . :execute 'vnew ' . expand('%:p:h')<CR>

" Exit terminal with ESC
tnoremap <ESC> <C-\><C-n>

" Exit insert mode with ";j"
inoremap ;j <ESC>

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
" TODO: open terminal in VS Code
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

" Open a separate terminal in the current directory
if has('win64') || has('win32') || has('win16')
    nnoremap T :!start powershell -NoExit -Command ""<CR>
endif

" Use normal navigation with the ALT key
nnoremap <A-w> :normal! w<CR>
nnoremap <A-e> :normal! e<CR>
nnoremap <A-b> :normal! b<CR>

" operator-pending mode
onoremap <A-w> :normal! w<CR>
onoremap <A-e> :normal! e<CR>
onoremap <A-b> :normal! b<CR>

" visual mode
xnoremap <A-w> :<C-u>normal! gvw<CR>
xnoremap <A-e> :<C-u>normal! gve<CR>
xnoremap <A-b> :<C-u>normal! gvb<CR>
