" These are my custom keybindings

" Exit terminal with ESC
tnoremap <ESC> <C-\><C-n>

" ==========SEARCHING===============
" Ignore case when searching
set ignorecase

" toggle search highlighting with F3
nnoremap <F3> :set hlsearch!<CR>

" set directories for backup, swap, and undo
set backupdir=~/.vim/backup//
set directory=~/.vim/swap//
set undodir=~/.vim/undo//

" Use Windows clipboard
set clipboard+=unnamedplus

" Yank from current cursor position to end of line
nnoremap Y y$

" jump to matching pairs with <TAB> in normal mode
nmap <Tab> %

" Map capital U to Redo.
noremap U <c-r>
noremap <c-r> <NOP>

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
let g:asyncrun_rootmarks = ['.svn', '.git', '.root', '_darcs', 'build.xml']
" If none of the above are found, the current file directory is used instead

" F7 build current project
nnoremap <silent> <F7> :AsyncRun -cwd==<root> make <cr>
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
