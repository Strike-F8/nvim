" ===================================================
" The following is for C projects which I rarely use so it goes in the comments
"" F9 compile single file
"nnoremap <silent> <F9> :AsyncRun g++ -Wextra -Werror -Wall -O2 -std=c++11 "$(VIM_FILEPATH)" -o "$(VIM_FILEDIR)/$(VIM_FILENOEXT)" <cr>
"
""F5 run file after compilation
"nnoremap <silent> <F5> :AsyncRun -raw -cwd=$(VIM_FILEDIR) "$(VIM_FILEDIR)/$(VIM_FILENOEXT)" <cr>
"
"" ASYNCRUN PROJECTS
"" locate project root
"let g:asyncrun_rootmarks = ['.sln', '.svn', '.git', '.root', '_darcs', 'build.xml']
"" If none of the above are found, the current file directory is used instead
"
"" F7 build current project
"nnoremap <silent> <F7> :AsyncRun -cwd==<root> make -S "$(VIM_FILEDIR)" -B "$(VIM_FILEDIR)/$(VIM_FILENOEXT)" <cr>
"" put empty .root file in project root to identify the project root
""nnoremap <silent> <F7> :AsyncRun -cwd==<root> make -S "$(VIM_FILEDIR)" -B "$(VIM_FILEDIR)/$(VIM_FILENOEXT)" <cr>
"" F8 run current project
"nnoremap <silent> <F8> :AsyncRun -cwd=<root> -raw make run <cr>
"
"" F6 test current project
"nnoremap <silent> <F6> :AsyncRun -cwd=<root> -raw make test <cr>
"
"" F11 update MakeFile with cmake
"nnoremap <silent> <F11> :AsyncRun -cwd=<root> cmake . <cr>
"
"" F2 search symbol definition and references
"if has('win32') || has('win64')
"    noremap <silent> <F2> :AsyncRun! -cwd=<root> findstr /n /s /C:"<C-R><C-W>"
"        \ "\%CD\%\*.h" "\%CD\%\*.c*" "\%CD\%\*.py" "\%CD\%\*.rb"<cr>
"else
"    noremap <silent> <F2> :AsyncRun! -cwd=<root> grep -n -s -R <C-R><C-W>
"            \ --include='*.h' --include='*.c*' --include='*.rb' --include='*.py' '<root>' <cr>
"endif
"
