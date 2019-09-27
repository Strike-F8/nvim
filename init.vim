" source init.vim from the present working directory
" set exrc
" Restrict usage of some commands for security reasons
" set secure

" VUNDLE CONFIG
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" vim-surround: Easily edit surrounding quotes and parentheses

Plugin 'vim-surround'

" vim-airline: Status bar at the bottom
Plugin 'vim-airline'

" YouCompleteMe
Plugin 'ycm-core/YouCompleteMe'

" AsyncRun run commands asynchronously and output to quickfix window
Plugin 'skywind3000/asyncrun.vim'

" Errormarker highlights lines that contain errors
Plugin 'mh21/errormarker.vim'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line
" END VUNDLE CONFIG

" NOW FOR MY STUFF
set encoding=utf-8
" show line number and relative line number
set number
" tab options
set tabstop=4
set shiftwidth=4

set nojoinspaces
set smarttab
set expandtab
set smartindent

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

" colors!!!
colo desert
syntax on

" highlight 80th and 100th column so that I don't go past it
" https://vi.stackexchange.com/questions/356/how-can-i-set-up-a-ruler-at-a-specific-column
highlight ColorColumn ctermbg=white guibg=white
call matchadd('ColorColumn', '\(\%80v\|\%100v\)')

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

" highlight closing bracket for tags
set matchpairs+=<:>

" Enable spell checker
set spell

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

" Enable capslock integration
let g:airline#extensions#capslock#enabled = 1

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
