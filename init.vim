" source vim configuration files
source $HOME\AppData\Local\nvim\format.vim
source $HOME\AppData\Local\nvim\html.vim
source $HOME\AppData\Local\nvim\keybindings.vim
source $HOME\AppData\Local\nvim\theme.vim

" source init.vim from the present working directory
set exrc
" Restrict usage of some commands for security reasons
" because using another init.vim could possibly be risky
set secure

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
