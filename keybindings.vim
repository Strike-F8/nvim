" Open neovim configuration directory in a new vertical buffer
" Configuration is in a different location depending on OS
" but $MYVIMRC is a variable stored by nvim that always leads to the configuration file
" Ctrl-Z for Windows and Linux
" F4 for macOS

if has('mac') || has('macunix')
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

" toggle search highlighting with F3
nnoremap <F3> :set hlsearch!<CR>

" Enter command mode with ; rather than :
nnoremap ; :

" rebind repeating f commands
" forwards
nnoremap <silent> , ;
" backwards
nnoremap <silent> s ,

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

" Buffer switching from normal mode using leader key (\)
" Switch to next buffer
nnoremap <leader>k :bn<CR>
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

" Move tab to the right
nnoremap <leader>s :+tabmove<CR>

" Move tab to the left
nnoremap <leader>a :-tabmove<CR>

" Close the current tab
nnoremap <leader>c :tabclose<CR>

" Open a new tab
nnoremap <leader>n :tabnew<CR>

" Open a separate terminal in the current directory
if has('win64') || has('win32') || has('win16')
    nnoremap <silent> T :!start powershell -NoExit -Command ""<CR>
endif

" Expand g motions
function! JumpToCommentTextStart()
    let line_num	= line('.')
    let line		= getline(line_num)
    let comment_string	= get(b:, 'commentstring', &commentstring)

    if empty(comment_string) || comment_string ==# '%s'
	normal! ^
	return
    endif

    let leader	= substitute(split(comment_string, '%s')[0], '\s\+$', '', '')
    let pattern	= '^\s*' . '\V' . escape(leader, '\.^$~[]*') . '\v\s*\zs\S'
    let index	= match(line, pattern)

    if index >= 0
	call cursor(line_num, index + 1)
    else
	normal! ^
    endif
endfunction

" Jump to the end of the line
noremap gl $

" Jump to the beginning of the comment. Otherwise, to the beginning of the line
noremap <silent> gh :call JumpToCommentTextStart()<CR>

" Start editing at the beginning of the comment. Otherwise, at the beginning of the line
nnoremap <silent> I :call JumpToCommentTextStart()<Bar>startinsert<CR>

" Toggle the quickfix list with F10
nnoremap <silent> <F10> :call ToggleQuickfix()<CR>

function! ToggleQuickfix()
    for win in range(1, winnr('$'))
	if getwinvar(win, '&buftype') ==# 'quickfix'
	    cclose
	    return
	endif
    endfor
    copen
endfunction
