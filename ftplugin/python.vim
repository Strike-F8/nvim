" run current python file with F5
nnoremap <F5> :AsyncRun -cwd=$(VIM_FILEDIR) -mode=term -pos=TAB  python "$(VIM_FILEPATH)"<CR>
