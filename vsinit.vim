" Fix line numbers disappearing in VS Code
set number

" Load keybindings
execute 'source' fnameescape(stdpath('config') . '/keybindings.vim')

" Load select plugins
set nocompatible
filetype off
call plug#begin('$HOME/.vim/bundle')

" vim-move
Plug 'matze/vim-move'

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

" Highlight the word under the cursor
Plug 'RRethy/vim-illuminate'

call plug#end()            " required
filetype plugin indent on    " required
syntax enable

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
