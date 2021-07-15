" These are my custom keybindings

" Exit terminal with ESC
tnoremap <ESC> <C-\><C-n>

" Exit insert mode with ";sd"
inoremap ;sd <ESC>

" ==========SEARCHING===============
" Ignore case when searching
set ignorecase

" toggle search highlighting with F3
nnoremap <F3> :set hlsearch!<CR>

" Enter command mode with ; rather than :
nnoremap ; :

" set directories for backup, swap, and undo
set backupdir=~/.vim/backup//
set directory=~/.vim/swap//
set undodir=~/.vim/undo//

" Use OS clipboard
set clipboard+=unnamedplus

" Yank from current cursor position to end of line
nnoremap Y y$

" jump to matching pairs with <TAB> in normal mode
nmap <Tab> %

" Change leader key to period (.)
let mapleader = "."

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

nnoremap <C-F8> :call NextColor(1)<CR>
nnoremap <S-F8> :call NextColor(-1)<CR>
nnoremap <A-F8> :call NextColor(0)<CR>

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

nnoremap <A-`> :call ScreenSaver() <cr>

" Open neovim configuration directory in a new vertical buffer
" Configuration is in a different location depending on OS
if has("win64") || has("win32") || has("win16")
    "Windows
    nnoremap <silent> <C-`> :vnew $HOME\AppData\Local\nvim <cr>
elseif system('uname -s') == "Darwin\n"
    "OSX
    nnoremap <silent> <F4> :vnew ~/.config/nvim<cr>
else
    "Linux (Not tested yet)
    nnoremap <silent> <C-`> ;vnew ~/.config/nvim<cr>
endif
