" vim-plug CONFIG
set nocompatible              " be iMproved, required
filetype off                  " required

call plug#begin('$HOME\.vim\bundle')

" elm-vim: syntax, indentation, build, formatting, etc. for elm-lang
Plug 'ElmCast/elm-vim'

" vim-surround: Easily edit surrounding quotes and parentheses
Plug 'tpope/vim-surround'

" vim-airline: Status bar at the bottom
Plug 'vim-airline/vim-airline'

" dispatch.vim - Asynchronous build and test dispatcher
Plug 'tpope/vim-dispatch'

" AsyncRun run commands asynchronously and output to quickfix window
Plug 'skywind3000/asyncrun.vim'

" Errormarker highlights lines that contain errors
Plug 'mh21/errormarker.vim'

" ALE: syntax fixing and linting for many languages including Ruby and Python
Plug 'dense-analysis/ale'

" rust.vim: Rust file detection, highlighting, formatting etc..
Plug 'rust-lang/rust.vim'

" RACER: Rust autocompletion
Plug 'racer-rust/racer'

" plastic theme
Plug 'flrnd/plastic.vim'

" monokai-tasty theme
Plug 'patstockwell/vim-monokai-tasty'

" vim-colorschemes pack
Plug 'flazz/vim-colorschemes'

" vim-quickui
Plug 'skywind3000/vim-quickui'

" All of your Plugins must be added before the following line
call plug#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PlugList       - lists configured plugins
" :PlugInstall    - Install plugins
" :PlugUpdate	  - Install or update plugins
" :PlugClean      - Remove unlisted plugins
" :PlugUpgrade	  - Upgrade vim-plug itself
" :PlugStatus	  - Check the status of plugins
" :PlugDiff	  - Examine changes from the previous update and the pending changes
" :PlugSnapshot	  - Generate script for restoring the current snapshot of plugins
"
" Plugin configuration
" set AsyncRun's encoding to be the same as neovim
let g:asyncrun_encs = 'gbk'

" display AsyncRun status in vim-airline
let g:asyncrun_status = "stopped"
let g:airline_section_error = airline#section#create_right(['%{g:asyncrun_status}'])

" vim-airline configuration
" Display all buffers when only one tab is open
let g:airline#extensions#tabline#enabled = 1

" Buffer indicator format: display full path on top right of buffer
let g:airline#extensions#tabline#formatter = 'unique_tail'

" Enable Capslock integration
let g:airline#extensions#capslock#enabled = 1

" SQL workbench configuration
let g:sw_exe = "C:\\tools\\sqlworkbench\\SQLWorkbench.cmd"
let g:sw_tmp = "/tmp"
let g:sw_config_dir = "$HOME\\.sqlworkbench"

" BLOCK SELECTION
" https://stackoverflow.com/questions/1676632/whats-a-quick-way-to-comment-uncomment-lines-in-vim/1676690#1676690

" The following was taken from https://github.com/optimizacija/neovim-config/blob/master/init.vim
" ################## Clang format #################

" Clang format - auto formatting

let g:clang_format#command = 'clang-format-3.8'
let g:clang_format#style_options = {
			\ "BreakBeforeBraces" : "Attach",
			\ "UseTab" : "Never",
			\ "IndentWidth" : 4,
			\ "ColumnLimit" : 100,
			\ "AccessModifierOffset" : -4,
			\ "AllowShortIfStatementsOnASingleLine" : "false",
			\ "AllowShortFunctionsOnASingleLine" : "false",
			\}
" shortcuts for autoformatting an entire C-family file: Ctrl+j
inoremap <C-j> <Esc>:ClangFormat<CR>a
nnoremap <C-j> <Esc>:ClangFormat<CR>

" ALE configuration: show the number of errors and warnings in status bar
" Taken from https://www.vimfromscratch.com/articles/vim-for-ruby-and-rails-in-2019/
function! LinterStatus() abort
    let l:counts = ale#statusline#Count(bufnr(''))

    let l:all_errors = l:counts.error + l:counts.style_error
    let l:all_non_errors = l:counts.total - l:all_errors

    return l:counts.total == 0 ? '✨ all good ✨' : printf(
		\ '😞 %dW %dE',
		\ all_non_errors,
		\ all_errors
		\)
endfunction

set statusline=
set statusline+=%m
set statusline+=\ %f
set statusline+=%=
set statusline+=\ %{LinterStatus()}
filetype on

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

" F12 compile single file with SDL
nnoremap <silent> <F12> :AsyncRun g++ "$(VIM_FILEPATH)" -Wextra -Werror -Wall -O2 -std=c++11 -IC:\Win-builds\SDL\SDL2-2.0.10\x86_64-w64-mingw32\include\SDL2 -LC:\Win-builds\SDL\SDL2-2.0.10\x86_64-w64-mingw32\lib -lmingw32 -lSDL2main -lSDL2 -o "$(VIM_FILEDIR)/$(VIM_FILENOEXT)" <cr>

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

" Change the color scheme from a list of color scheme names.
" Version 2010-09-12 from http://vim.wikia.com/wiki/VimTip341
" Press key:
"   F8                next scheme
"   Shift-F8          previous scheme
"   Alt-F8            random scheme
" Set the list of color schemes used by the above (default is 'all'):
"   :SetColors all              (all $VIMRUNTIME/colors/*.vim)
"   :SetColors my               (names built into script)
"   :SetColors blue slate ron   (these schemes)
"   :SetColors                  (display current scheme names)
" Set the current color scheme based on time of day:
"   :SetColors now
if v:version < 700 || exists('loaded_setcolors') || &cp
  finish
endif

let loaded_setcolors = 1
let s:mycolors = ['slate', 'torte', 'darkblue', 'delek', 'murphy', 'elflord', 'pablo', 'koehler']  " colorscheme names that we use to set color

" Set list of color scheme names that we will use, except
" argument 'now' actually changes the current color scheme.
function! s:SetColors(args)
  if len(a:args) == 0
    echo 'Current color scheme names:'
    let i = 0
    while i < len(s:mycolors)
      echo '  '.join(map(s:mycolors[i : i+4], 'printf("%-14s", v:val)'))
      let i += 5
    endwhile
  elseif a:args == 'all'
    let paths = split(globpath(&runtimepath, 'colors/*.vim'), "\n")
    let s:mycolors = uniq(sort(map(paths, 'fnamemodify(v:val, ":t:r")')))
    echo 'List of colors set from all installed color schemes'
  elseif a:args == 'my'
    let c1 = 'default elflord peachpuff desert256 breeze morning'
    let c2 = 'darkblue gothic aqua earth black_angus relaxedgreen'
    let c3 = 'darkblack freya motus impact less chocolateliquor'
    let s:mycolors = split(c1.' '.c2.' '.c3)
    echo 'List of colors set from built-in names'
  elseif a:args == 'now'
    call s:HourColor()
  else
    let s:mycolors = split(a:args)
    echo 'List of colors set from argument (space-separated names)'
  endif
endfunction

command! -nargs=* SetColors call s:SetColors('<args>')

" Set next/previous/random (how = 1/-1/0) color from our list of colors.
" The 'random' index is actually set from the current time in seconds.
" Global (no 's:') so can easily call from command line.
function! NextColor(how)
  call s:NextColor(a:how, 1)
endfunction

" Helper function for NextColor(), allows echoing of the color name to be
" disabled.
function! s:NextColor(how, echo_color)
  if len(s:mycolors) == 0
    call s:SetColors('all')
  endif
  if exists('g:colors_name')
    let current = index(s:mycolors, g:colors_name)
  else
    let current = -1
  endif
  let missing = []
  let how = a:how
  for i in range(len(s:mycolors))
    if how == 0
      let current = localtime() % len(s:mycolors)
      let how = 1  " in case random color does not exist
    else
      let current += how
      if !(0 <= current && current < len(s:mycolors))
        let current = (how>0 ? 0 : len(s:mycolors)-1)
      endif
    endif
    try
      execute 'colorscheme '.s:mycolors[current]
      break
    catch /E185:/
      call add(missing, s:mycolors[current])
    endtry
  endfor
  redraw
  if len(missing) > 0
    echo 'Error: colorscheme not found:' join(missing)
  endif
  if (a:echo_color)
    echo g:colors_name
  endif
endfunction

" nnoremap <F8> :call NextColor(1)<CR>
" nnoremap <S-F8> :call NextColor(-1)<CR>
" nnoremap <A-F8> :call NextColor(0)<CR>

" Set color scheme according to current time of day.
function! s:HourColor()
  let hr = str2nr(strftime('%H'))
  if hr <= 3
    let i = 0
  elseif hr <= 7
    let i = 1
  elseif hr <= 14
    let i = 2
  elseif hr <= 18
    let i = 3
  else
    let i = 4
  endif
  let nowcolors = 'elflord morning desert evening pablo'
  execute 'colorscheme '.split(nowcolors)[i]
  redraw
  echo g:colors_name
endfunction

" ALT-` Set neovim to change colors every 10 seconds
function! ScreenSaver()
    while 1
        sleep 10
        call NextColor(1)
    endwhile
endfunction

nnoremap <A-`> :call screensaver()

" HTML-specific configuration

" The following was taken from
" https://stackoverflow.com/questions/2154193/using-vim-as-a-html-editor
" HTML wrap selected text with tags
function! VisualTagsWrap()
	if !exists('g:tags_to_wrap')
		let g:tags_to_wrap=[]
	endif
	let g:tags_to_wrap=split(input('space separated tags to wrap block: ', join(g:tags_to_wrap, ' ')), '\s\+')
	if len(g:tags_to_wrap)>0
		execute 'normal! '>a</'.join(reverse(g:tags_to_wrap), '></').'>'
		execute 'normal! '<i<'.join(reverse(g:tags_to_wrap), '><').'>'
	endif
endfunction

vnoremap <silent>,w <ESC>:call VisualTagsWrap()<CR>

" Formatting
" ex. tab width

set encoding=utf-8
" show line number and relative line number
set number
" tab options
set tabstop=8
set softtabstop=4
set shiftwidth=4

" clear all the menus
call quickui#menu#reset()

" install a 'File' menu, use [text, command] to represent an item.
call quickui#menu#install('&File', [
            \ [ "&New File\tCtrl+n", 'echo 0' ],
            \ [ "&Open File\t(F3)", 'echo 1' ],
            \ [ "&Close", 'echo 2' ],
            \ [ "--", '' ],
            \ [ "&Save\tCtrl+s", 'echo 3'],
            \ [ "Save &As", 'echo 4' ],
            \ [ "Save All", 'echo 5' ],
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
			\ ])

" register HELP menu with weight 1000
call quickui#menu#install('H&elp', [
			\ ["&Cheatsheet", 'help index', ''],
			\ ['T&ips', 'help tips', ''],
			\ ['--',''],
			\ ["&Tutorial", 'help tutor', ''],
			\ ['&Quick Reference', 'help quickref', ''],
			\ ['&Summary', 'help summary', ''],
			\ ], 10000)

" enable to display tips in the cmdline
let g:quickui_show_tip = 1

" hit space twice to open menu
noremap <space><space> :call quickui#menu#open()<cr>

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
