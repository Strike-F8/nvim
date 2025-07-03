" vim-plug CONFIG
set nocompatible              " be iMproved, required
filetype off                  " required

call plug#begin('$HOME/.vim/bundle')

" csv/csv like filetype highlighting
Plug 'mechatroner/rainbow_csv'

" tom language syntax highlighting
Plug 'https://gitlab.com/Strike_F8/tom-vim'

" Better json support
Plug 'VPavliashvili/json-nvim'

" Better python folding
Plug 'tmhedberg/SimpylFold'

" Intellisense for C#
Plug 'OmniSharp/omnisharp-vim'

" IFC file syntax highlighting
Plug 'https://gitlab.com/Strike_F8/ifc-vim'

" autocorrect.vim Autocorrect misspelled words from a predefined list
Plug 'mitchpaulus/autocorrect.vim'

" IndentLine: Display indentation guides in yaml files
Plug 'Yggdroot/indentLine'

" vim-smoothie - smooth scrolling!
Plug 'psliwka/vim-smoothie'

" vim-javacomplete2: omni-completion plugin for Java
Plug 'artur-shaik/vim-javacomplete2'

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

" vim-snippets. More code snippets for markdown
Plug 'honza/vim-snippets'

" vim-markdown. Markdown highlighting
Plug 'plasticboy/vim-markdown'

" markdown preview
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app & yarn install', 'for': 'markdown'  }

" Code completion
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" Smooth scrolling
Plug 'yonchu/accelerated-smooth-scroll'

" File navigation
Plug 'lokaltog/vim-easymotion'

" Git support
Plug 'tpope/vim-fugitive'

" Github support
Plug 'tpope/vim-rhubarb'

" Allow repetition of plugin mappings
Plug 'tpope/vim-repeat'

" Commenting plugin
Plug 'tpope/vim-commentary'

" Display diff symbols
Plug 'mhinz/vim-signify'

    " FileTree navigator
    Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggleVCS' }

    " Nerdtree plugin to show git status
    Plug 'Xuyuanp/nerdtree-git-plugin'

    " Add developer icons
    Plug 'ryanoasis/vim-devicons'

" Automatically set cwd
Plug 'airblade/vim-rooter'

" View LSP Symbols
Plug 'liuchengxu/vista.vim'

" Pulse the line after a search
Plug 'danilamihailov/beacon.nvim'

" Highlight word under the cursor
Plug 'RRethy/vim-illuminate'

" Limelight
Plug 'junegunn/limelight.vim'

" Org-mode for vim
Plug 'jceb/vim-orgmode'

" Undo tree
Plug 'sjl/gundo.vim'

" Print documents in the echo area
Plug 'Shougo/echodoc.vim'

" Add common snippets
Plug 'honza/vim-snippets'

" All of your Plugins must be added before the following line
call plug#end()            " required
filetype plugin indent on    " required
syntax enable
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
" javacomplete2 configuration
autocmd FileType java setlocal omnifunc=javacomplete#Complete
" set JAVA_HOME so JDK is used instead of JRE https://stackoverflow.com/a/46885299

" set AsyncRun's encoding to be the same as neovim
let g:asyncrun_encs = 'gbk'

" display AsyncRun status in vim-airline
"let g:asyncrun_status = "stopped"
"let g:airline_section_error = airline#section#create_right(['%{g:asyncrun_status}'])

" Configure IndentLine to display a thinner line
" let g:indentLine_char = '⦙'

" AUTO-CORRECT CONFIGURATION

" Load for particular file types
let g:AutocorrectFiletypes = ["text","markdown"]

" Change auto-correct file location
if has('win32') || has('win16')
    let g:AutocorrectPersonalFile='~\AppData\local\nvim\autocorrect.txt'
else
    let g:AutocorrectPersonalFile='~/.config/nvim/autocorrect.txt'
endif

" VIM-AIRLINE CONFIGURATION
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

" Configure Omnisharp
" Enable highlighting in insert mode
let g:OmniSharp_highlighting = 3

" BLOCK SELECTION
" https://stackoverflow.com/questions/1676632/whats-a-quick-way-to-comment-uncomment-lines-in-vim/1676690#1676690

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

" do not lint while typing
let g:ale_lint_on_text_changed = 'never'
" Integrate ale with airline
let g:airline#exxtensions#ale#enabled = 1

set statusline=
set statusline+=%m
set statusline+=\ %f
set statusline+=%=
set statusline+=\ %{LinterStatus()}
filetype on

" Automatically change directory when opening files, changing buffers etc
set autochdir

" previm config
let g:previm_open_cmd = 'start "" "C:\Program Files\BraveSoftware\Brave-Browser\Application\brave.exe"'


