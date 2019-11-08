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

" dispatch.vim - Asynchronous build and test dispatcher
Plugin 'tpope/vim-dispatch'

" AsyncRun run commands asynchronously and output to quickfix window
Plugin 'skywind3000/asyncrun.vim'

" Errormarker highlights lines that contain errors
Plugin 'mh21/errormarker.vim'

" ALE: syntax fixing and linting for many languages including Ruby and Python
Plugin 'dense-analysis/ale'

" rust.vim: Rust file detection, highlighting, formatting etc..
Plugin 'rust-lang/rust.vim'

" RACER: Rust autocompletion
Plugin 'racer-rust/racer'

" irblack theme
Plugin 'twerth/vim-irblack'

" plastic theme
Plugin 'flrnd/plastic.vim'

" monokai-tasty theme
Plugin 'patstockwell/vim-monokai-tasty'

" vim-colorschemes pack
Plugin 'flazz/vim-colorschemes'

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
