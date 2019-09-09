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

" jedi-vim: jump to assignments, definitions, documentation and code
" completion

Plugin 'jedi-vim'

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

" Now for my stuff
set encoding=utf-8
" show line number and relative line number
set number
" tab options
set tabstop=4
set shiftwidth=4

set nojoinspaces

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

" vim-airline configuration
" Display all buffers when only one tab is open
let g:airline#extensions#tabline#enabled = 1

" Buffer indicator format: display full path on top right of buffer
let g:airline#extensions#tabline#formatter = 'unique_tail'

" Enable capslock integration
let g:airline#extensions#capslock#enabled = 1
" BLOCK SELECTION
" https://stackoverflow.com/questions/1676632/whats-a-quick-way-to-comment-uncomment-lines-in-vim/1676690#1676690
" Plugins go down here when I find some!!
