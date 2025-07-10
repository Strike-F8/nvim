" clear all the menus
call quickui#menu#reset()

" install a 'File' menu, use [text, command] to represent an item.
call quickui#menu#install('&File', [
            \ [ "&New File\tCtrl+n", 'echo 0' ],
            \ [ "&Open File\t(F3)", 'echo 1' ],
            \ [ "&Close", ':q<CR>' ],
            \ [ "&Toggle Nvim-Tree", ':NvimTreeToggle<CR>' ],
            \ [ "--", '' ],
            \ [ "&Save\tCtrl+s", ':w<CR>'],
            \ [ "Save &As", ':saveas ' ],
            \ [ "Save All", ':wa<CR>' ],
            \ [ "--", '' ],
            \ [ "E&xit\tAlt+x", 'echo 6' ],
            \ ])

" items containing tips, tips will display in the cmdline
call quickui#menu#install('&Edit', [
            \ [ '&Copy', 'echo 1', 'help 1' ],
            \ [ '&Paste', 'echo 2', 'help 2' ],
            \ [ '&Find', 'echo 3', 'help 3' ],
            \ ])

" script inside %{...} will be evaluated and expanded in the string
call quickui#menu#install("&Option", [
			\ ['Set &Spell %{&spell? "Off":"On"}', 'set spell!'],
			\ ['Set &Cursor Line %{&cursorline? "Off":"On"}', 'set cursorline!'],
			\ ['Set &Paste %{&paste? "Off":"On"}', 'set paste!'],
			\ ['Set &hlsearch %{&hlsearch? "Off":"On"}', 'set hlsearch!'],
			\ ])

" register HELP menu with weight 1000
call quickui#menu#install('&Help', [
			\ ["&Cheatsheet", 'help index', ''],
			\ ['T&ips', 'help tips', ''],
			\ ['--',''],
			\ ["&Tutorial", 'help tutor', ''],
			\ ['&Quick Reference', 'help quickref', ''],
			\ ['&Summary', 'help summary', ''],
			\ ], 10000)

" register PROJECT menu for shortcuts to build projects
" TODO: work in progress
call quickui#menu#install('&PROJECT', [
			\ ['&Build project', ''],
			\ ['&Run project', ''],
			\ ])

" register CONFIG menu for modifying neovim configuration files
" The paths will be different according to each operating system
if has("win32") || has("win16")
    call quickui#menu#install('&CONFIG', [
			    \ ['&init.vim', 'vnew $HOME\AppData\Local\nvim\init.vim'],
			    \ ['&keybindings.vim', 'vnew $HOME\AppData\Local\nvim\keybindings.vim'],
			    \ ['Go to Configuration &Directory', 'vnew $HOME\AppData\Local\nvim'],
			    \ ])
else
    call quickui#menu#install('&CONFIG', [
			    \ ['&init.vim', 'vnew ~/.config/nvim/init.vim'],
			    \ ['&keybindings.vim', 'vnew ~/.config/nvim/keybindings.vim'],
			    \ ['Go to Configuration &Directory', 'vnew ~/.config/nvim'],
			    \ ])
endif

" enable to display tips in the cmdline
let g:quickui_show_tip = 1

" hit space twice to open menu
noremap <space><space> :call quickui#menu#open()<cr>
