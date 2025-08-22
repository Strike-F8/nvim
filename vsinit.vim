" Load keybindings
if has('win64') || has('win32') || has('win16')
    source $HOME\AppData\Local\nvim\keybindings.vim
else
    source ~/.config/nvim/keybindings.vim
endif

" Load select plugins
set nocompatible
filetype off
call plug#begin('$HOME/.vim/bundle')

" Multiple cursors
Plug 'mg979/vim-visual-multi'

" easy commenting
Plug 'vim-commentary'

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
