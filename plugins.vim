" vim-plug CONFIG
set nocompatible              " be iMproved, required
filetype off                  " required
call plug#begin('$HOME/.vim/bundle')

" Camel/snake case word motion
Plug 'bkad/CamelCaseMotion'

" Easy undo history
Plug 'mbbill/undotree'

" rainbow parentheses
Plug 'kien/rainbow_parentheses.vim'

" Multiple cursors
Plug 'mg979/vim-visual-multi'

" scrollbar\stripe on right side
Plug 'petertriho/nvim-scrollbar'
Plug 'lewis6991/gitsigns.nvim'
Plug 'kevinhwang91/nvim-hlslens'

" Better directory view
" Plug 'nvim-tree/nvim-web-devicons'
" Plug 'nvim-tree/nvim-tree.lua'
Plug 'preservim/nerdtree'

" csv/csv like filetype highlighting
Plug 'mechatroner/rainbow_csv'

" tom language syntax highlighting
Plug 'https://gitlab.com/Strike_F8/tom-vim'

" tpf file syntax highlighting
Plug 'https://gitlab.com/Strike_F8/tpf-vim'

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

" vim-surround: Easily edit surrounding quotes and parentheses
Plug 'tpope/vim-surround'

" vim-airline: Status bar at the bottom
Plug 'vim-airline/vim-airline'

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

" Enable nvim-scrollbar
lua require("gitsigns").setup()
lua require("scrollbar.handlers.gitsigns").setup()
lua require("scrollbar").setup()

" Rainbow parentheses config
let g:rbpt_colorpairs = [
    \ ['brown',       'RoyalBlue3'],
    \ ['Darkblue',    'SeaGreen3'],
    \ ['darkgray',    'DarkOrchid3'],
    \ ['darkgreen',   'firebrick3'],
    \ ['darkcyan',    'RoyalBlue3'],
    \ ['darkred',     'SeaGreen3'],
    \ ['darkmagenta', 'DarkOrchid3'],
    \ ['brown',       'firebrick3'],
    \ ['gray',        'RoyalBlue3'],
    \ ['black',       'SeaGreen3'],
    \ ['darkmagenta', 'DarkOrchid3'],
    \ ['Darkblue',    'firebrick3'],
    \ ['darkgreen',   'RoyalBlue3'],
    \ ['darkcyan',    'SeaGreen3'],
    \ ['darkred',     'DarkOrchid3'],
    \ ['red',         'firebrick3'],
    \ ]

let g:rbpt_loadcmd_toggle = 0
let g:rbpt_max = 16

" Undo tree config
nnoremap t :UndotreeToggle<CR>

" Show a full-width diff window at the bottom
if !exists('g:undotree_WindowLayout')
    let g:undotree_WindowLayout = 2
endif

" On windows, use a supported command for diffing files
if has('win64') || has('win32') || has('win16')
    let g:undotree_DiffCommand = "FC"
endif

" Persistent undo across sessions
if has("persistent_undo")
    let undo_path = expand('~/.undotree')

    if !isdirectory(undo_path)
	call mkdir(undo_path, "p", 0700)
    endif

    let &undodir=undo_path
    set undofile
endif
 
let g:VM_theme = 'iceblue'
" 'iceblue', 'olive', 'codedark', 'sand'

let g:VM_default_mappings = 0

let g:VM_maps = {}
let g:VM_maps["Find Under"]         = '<C-n>'
let g:VM_maps["Find Subword Under"] = '<C-n>'
let g:VM_maps["Select All"]         = '\\A' 
let g:VM_maps["Start Regex Search"] = '\\/'
let g:VM_maps["Add Cursor Down"]    = '<c-j>'
let g:VM_maps["Add Cursor Up"]      = '<c-k>' 
let g:VM_maps["Select Cursor Down"] = '<C-S-j>'
let g:VM_maps["Select Cursor Up"]   ='<C-S-k>'
let g:VM_maps["Add Cursor At Pos"]  = '\\\'

let g:VM_maps["Visual Regex"]       = '\\/'
let g:VM_maps["Visual All"]         = '\\A' 
let g:VM_maps["Visual Add"]         = '\\a'
let g:VM_maps["Visual Find"]        = '\\f'
let g:VM_maps["Visual Cursors"]     = '\\c'

" vim-commentary config
autocmd FileType toms setlocal commentstring=//\ %s " commenting for toms files
autocmd FileType tpf setlocal commentstring=//\ %s " commenting for tpf files
autocmd FileType tbl setlocal commentstring=//\ %s " commenting for tbl files

" CamelCaseMotion config
" Replace the w, b, e, and ge motions with CamelCaseMotion
map <silent> w <Plug>CamelCaseMotion_w
map <silent> b <Plug>CamelCaseMotion_b
map <silent> e <Plug>CamelCaseMotion_e
map <silent> ge <Plug>CamelCaseMotion_ge
sunmap w
sunmap b
sunmap e
sunmap ge
