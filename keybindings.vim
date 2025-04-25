" These are my custom keybindings

" Open neovim configuration directory in a new vertical buffer
" Configuration is in a different location depending on OS
" but $MYVIMRC is a variable stored by nvim that always leads to the configuration file
" CTRL-` (back-tick) for Windows and Linux
" F4 for macOS

if system('uname -s') == "Darwin\n"
    "macOS (Not tested yet as I no longer have a mac)
    nnoremap <silent> <F4> :vnew $MYVIMRC/..
else
    "Windows and Linux
    nmap <silent> <C-`> :vnew $MYVIMRC/..<cr>
endif

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

" jump to matching pairs with <TAB> in normal mode
nmap <Tab> %

" Change the current line to title case (Every first letter is capitalized)
" Disable search highlighting until the next search so that everything does
" not become highlighted
nnoremap <silent> gG :s/\v<(.)(\w*)/\u\1\L\2/g <bar> :noh<cr>

" ASYNCRUN shortcuts/configuration
" Open Quickfix window at 8 lines height
let g:asyncrun_open = 8

" Ring the bell when AsyncRun is finished
let g:asyncrun_bell = 1

" Get errormarker to process the quickfix window after :make
let g:asyncrun_auto = "make"

" F10 toggle quickfix window
nnoremap <F10> :call asyncrun#quickfix_toggle(6)<cr>

" F9 compile single file
nnoremap <silent> <F9> :AsyncRun g++ -Wextra -Werror -Wall -O2 -std=c++11 "$(VIM_FILEPATH)" -o "$(VIM_FILEDIR)/$(VIM_FILENOEXT)" <cr>

"F5 run file after compilation
nnoremap <silent> <F5> :AsyncRun -raw -cwd=$(VIM_FILEDIR) "$(VIM_FILEDIR)/$(VIM_FILENOEXT)" <cr>

" ASYNCRUN PROJECTS
" locate project root
let g:asyncrun_rootmarks = ['.sln', '.svn', '.git', '.root', '_darcs', 'build.xml']
" If none of the above are found, the current file directory is used instead

" F7 build current project
nnoremap <silent> <F7> :AsyncRun -cwd==<root> make -S "$(VIM_FILEDIR)" -B "$(VIM_FILEDIR)/$(VIM_FILENOEXT)" <cr>
" put empty .root file in project root to identify the project root

" F8 run current project
nnoremap <silent> <F8> :AsyncRun -cwd=<root> -raw make run <cr>

" F6 test current project
nnoremap <silent> <F6> :AsyncRun -cwd=<root> -raw make test <cr>

" F11 update MakeFile with cmake
nnoremap <silent> <F11> :AsyncRun -cwd=<root> cmake . <cr>

" F2 search symbol definition and references
if has('win32') || has('win64')
    noremap <silent> <F2> :AsyncRun! -cwd=<root> findstr /n /s /C:"<C-R><C-W>"
        \ "\%CD\%\*.h" "\%CD\%\*.c*" "\%CD\%\*.py" "\%CD\%\*.rb"<cr>
else
    noremap <silent> <F2> :AsyncRun! -cwd=<root> grep -n -s -R <C-R><C-W>
            \ --include='*.h' --include='*.c*' --include='*.rb' --include='*.py' '<root>' <cr>
endif

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
