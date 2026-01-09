" vim-plug CONFIG
set nocompatible              " be iMproved, required
filetype off                  " required
call plug#begin('$HOME/.vim/bundle')

" Add more targets for operations
" Cheatsheet: https://github.com/wellle/targets.vim/blob/master/cheatsheet.md
Plug 'wellle/targets.vim'

" highlighting for f
Plug 'unblevable/quick-scope'

" Camel/snake case word motion
Plug 'Strike-F8/CamelCaseMotion'

" Easy undo history
Plug 'mbbill/undotree', { 'on': 'UndotreeToggle' }

" Multiple cursors
Plug 'mg979/vim-visual-multi'

" scrollbar\stripe on right side
Plug 'petertriho/nvim-scrollbar'
Plug 'lewis6991/gitsigns.nvim'
Plug 'kevinhwang91/nvim-hlslens'

" Better directory view
" Plug 'nvim-tree/nvim-web-devicons'
" Plug 'nvim-tree/nvim-tree.lua'
Plug 'preservim/nerdtree', { 'on': ['NERDTreeToggle', 'NERDTreeFind'] }

" csv/csv like filetype highlighting
Plug 'mechatroner/rainbow_csv', { 'for': ['csv', 'tsv'] }

" tom language syntax highlighting
Plug 'https://gitlab.com/taiwa1/tom/tom-vim', { 'for': 'toms' }

" tpf file syntax highlighting
Plug 'https://gitlab.com/taiwa1/tom/tpf-vim', { 'for': ['tpf', 'tbl'] }

" Better json support
Plug 'VPavliashvili/json-nvim', { 'for': ['json', 'jsonc'] }

" Better python folding
Plug 'tmhedberg/SimpylFold', { 'for': 'python' }

" Intellisense for C#
Plug 'OmniSharp/omnisharp-vim', { 'for': ['cs', 'csx'] }

" IFC file syntax highlighting
Plug 'https://gitlab.com/Strike_F8/ifc-vim', { 'for': 'ifc' }

" autocorrect.vim Autocorrect misspelled words from a predefined list
Plug 'mitchpaulus/autocorrect.vim', { 'for': ['text', 'markdown'] }

" IndentLine: Display indentation guides in yaml files
Plug 'Yggdroot/indentLine'

" vim-smoothie - smooth scrolling!
Plug 'psliwka/vim-smoothie'

" vim-airline: Status bar at the bottom
Plug 'vim-airline/vim-airline'

" Errormarker highlights lines that contain errors
Plug 'mh21/errormarker.vim'

" ALE: syntax fixing and linting for many languages including Ruby and Python
Plug 'dense-analysis/ale'

" rust.vim: Rust file detection, highlighting, formatting etc..
Plug 'rust-lang/rust.vim', { 'for': 'rust' }

" RACER: Rust autocompletion
Plug 'racer-rust/racer', { 'for': 'rust' }

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
Plug 'plasticboy/vim-markdown', { 'for': 'markdown' }

" markdown preview
" Install dependencies with :call mkdp#util#install()
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
Plug 'junegunn/limelight.vim', { 'on': 'Limelight' }

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
let g:airline#extensions#ale#enabled = 1

set statusline=
set statusline+=%m
set statusline+=\ %f
set statusline+=%=
set statusline+=\ %{LinterStatus()}

" Enable nvim-scrollbar
lua require("gitsigns").setup()
lua require("scrollbar.handlers.gitsigns").setup()
lua require("scrollbar").setup()

"" Undo tree config
nnoremap <leader>t :UndotreeToggle<CR>

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
 
" Configure multiple cursors
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
let g:VM_maps["Select Cursor Up"]   = '<C-S-k>'
let g:VM_maps["Add Cursor At Pos"]  = '\\\'

let g:VM_maps["Visual Regex"]       = '\\/'
let g:VM_maps["Visual All"]         = '\\A'
let g:VM_maps["Visual Add"]         = '\\a'
let g:VM_maps["Visual Find"]        = '\\f'
let g:VM_maps["Visual Cursors"]     = '\\c'

" vim-commentary config
augroup commentary_commentstring
    autocmd!
    autocmd FileType toms,tpf,tbl setlocal commentstring=//\ %s
augroup END

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

" Use normal navigation with the leader key
noremap <leader>w :normal! w<CR>
noremap <leader>e :normal! e<CR>
noremap <leader>b :normal! b<CR>

" visual mode
xnoremap <leader>w :<C-u>normal! gvw<CR>
xnoremap <leader>e :<C-u>normal! gve<CR>
xnoremap <leader>b :<C-u>normal! gvb<CR>

" iamcco markdown preview config

" set to 1, nvim will open the preview window after entering the Markdown buffer
" default: 0
let g:mkdp_auto_start = 1

" set to 1, the nvim will auto close current preview window when changing
" from Markdown buffer to another buffer
" default: 1
let g:mkdp_auto_close = 1

" set to 1, Vim will refresh Markdown when saving the buffer or
" when leaving insert mode. Default 0 is auto-refresh Markdown as you edit or
" move the cursor
" default: 0
let g:mkdp_refresh_slow = 0

" set to 1, the MarkdownPreview command can be used for all files,
" by default it can be use in Markdown files only
" default: 0
let g:mkdp_command_for_global = 0

" set to 1, the preview server is available to others in your network.
" By default, the server listens on localhost (127.0.0.1)
" default: 0
let g:mkdp_open_to_the_world = 0

" use custom IP to open preview page.
" Useful when you work in remote Vim and preview on local browser.
" For more details see: https://github.com/iamcco/markdown-preview.nvim/pull/9
" default empty
let g:mkdp_open_ip = ''

" specify browser to open preview page
" for path with space
" valid: `/path/with\ space/xxx`
" invalid: `/path/with\\ space/xxx`
" default: ''
let g:mkdp_browser = 'C:\Program Files\BraveSoftware\Brave-Browser\Application\brave.exe'

" set to 1, echo preview page URL in command line when opening preview page
" default is 0
let g:mkdp_echo_preview_url = 0

" a custom Vim function name to open preview page
" this function will receive URL as param
" default is empty
let g:mkdp_browserfunc = ''

" options for Markdown rendering
" mkit: markdown-it options for rendering
" katex: KaTeX options for math
" uml: markdown-it-plantuml options
" maid: mermaid options
" disable_sync_scroll: whether to disable sync scroll, default 0
" sync_scroll_type: 'middle', 'top' or 'relative', default value is 'middle'
"   middle: means the cursor position is always at the middle of the preview page
"   top: means the Vim top viewport always shows up at the top of the preview page
"   relative: means the cursor position is always at relative positon of the preview page
" hide_yaml_meta: whether to hide YAML metadata, default is 1
" sequence_diagrams: js-sequence-diagrams options
" content_editable: if enable content editable for preview page, default: v:false
" disable_filename: if disable filename header for preview page, default: 0
let g:mkdp_preview_options = {
    \ 'mkit': {},
    \ 'katex': {},
    \ 'uml': {},
    \ 'maid': {},
    \ 'disable_sync_scroll': 0,
    \ 'sync_scroll_type': 'middle',
    \ 'hide_yaml_meta': 1,
    \ 'sequence_diagrams': {},
    \ 'flowchart_diagrams': {},
    \ 'content_editable': v:false,
    \ 'disable_filename': 0,
    \ 'toc': {}
    \ }

" use a custom Markdown style. Must be an absolute path
" like '/Users/username/markdown.css' or expand('~/markdown.css')
let g:mkdp_markdown_css = ''

" use a custom highlight style. Must be an absolute path
" like '/Users/username/highlight.css' or expand('~/highlight.css')
let g:mkdp_highlight_css = ''

" use a custom port to start server or empty for random
let g:mkdp_port = ''

" preview page title
" ${name} will be replace with the file name
let g:mkdp_page_title = '「${name}」'

" recognized filetypes
" these filetypes will have MarkdownPreview... commands
let g:mkdp_filetypes = ['markdown']

" set default theme (dark or light)
" By default the theme is defined according to the preferences of the system
let g:mkdp_theme = 'dark'

" combine preview window
" default: 0
" if enable it will reuse previous opened preview window when you preview markdown file.
" ensure to set let g:mkdp_auto_close = 0 if you have enable this option
let g:mkdp_combine_preview = 1

" auto refetch combine preview contents when change markdown buffer
" only when g:mkdp_combine_preview is 1
let g:mkdp_combine_preview_auto_refresh = 1

"" config quick-scope
" highlight only on keypress instead of always
let g:qs_highlight_on_keys = ['f', 'F', 't', 'T']
