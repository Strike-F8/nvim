" Fix line numbers disappearing in VS Code
set number

" Load keybindings
execute 'source' fnameescape(stdpath('config') . '/keybindings.vim')

" Load select plugins
set nocompatible
filetype off
call plug#begin('$HOME/.vim/bundle')

" Easy undo history
Plug 'mbbill/undotree', { 'on': 'UndotreeToggle' }

" highlighting for f
Plug 'unblevable/quick-scope'

" Add more targets for operations
" Cheatsheet: https://github.com/wellle/targets.vim/blob/master/cheatsheet.md
Plug 'wellle/targets.vim'

" Camel/snake case word motion
Plug 'Strike-F8/CamelCaseMotion'

" Multiple cursors
Plug 'mg979/vim-visual-multi'

" easy commenting
Plug 'vim-commentary'

" markdown preview
" Install dependencies with :call mkdp#util#install()
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app & yarn install', 'for': 'markdown'  }

" Highlight the word under the cursor
Plug 'RRethy/vim-illuminate'

call plug#end()            " required
filetype plugin indent on    " required
syntax enable

"" Undo tree config
nnoremap <leader>t :UndotreeToggle<CR>

" disable the diff panel in VS Code
let g:undotree_DiffAutoOpen = 0

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
"
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
" enable quick-scope highlighting in VS Code
highlight QuickScopePrimary   guifg=#afff5f gui=underline
highlight QuickScopeSecondary guifg=#5fffff gui=underline
" highlight only on keypress instead of always
let g:qs_highlight_on_keys = ['f', 'F', 't', 'T']

" Bookmarks
lua << EOF

-- VSCode Neovim: call VS Code commands from Lua
local vscode = require("vscode")

-- Visual indicator toggle (gutter)
vim.keymap.set("n", "mm", function() vscode.action("bookmarks.toggle") end)

-- Next/previous
vim.keymap.set("n", "m]", function() vscode.action("bookmarks.jumpToNext") end)
vim.keymap.set("n", "m[", function() vscode.action("bookmarks.jumpToPrevious") end)

-- Preview/list (shows a picker/list; good “preview” workflow)
vim.keymap.set("n", "m:", function() vscode.action("bookmarks.list") end)

-- Across workspace
vim.keymap.set("n", "m?", function() vscode.action("bookmarks.listFromAllFiles") end)

-- Optional: labeled bookmark (acts like an annotated mark)
vim.keymap.set("n", "mL", function() vscode.action("bookmarks.toggleLabeled") end)
EOF
