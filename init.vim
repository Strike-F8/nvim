" Locate python in windows environment
" Assumes neovim's python is located within a conda virtual environment named "neovim"
if has('win64') || has('win32') || has('win16')
    let g:python3_host_prog = '~/AppData/Local/miniconda3/envs/neovim/python.exe'
endif

let s:config_root = stdpath('config')

function! s:SourceConfig(filename) abort
    execute 'source' fnameescape(s:config_root . '/' . a:filename)
endfunction

" Enable mouse scrolling and selecting in nvim-qt
set mouse=a

" Scroll before hitting the edge of the window
set scrolloff=5
set sidescrolloff=5

" Disable entering visual mode when dragging mouse
noremap <LeftDrag> <LeftMouse>
noremap! <LeftDrag> <LeftMouse>

" set directories for backup, swap, and undo
set backupdir=~/.vim/backup//
set directory=~/.vim/swap//
set undodir=~/.vim/undo//

if !exists('$VSCODE_PID') " If not running in VS Code, load normally
    " Load plugins first to prevent errors
    for s:config_file in [
                \ 'plugins.vim',
                \ 'format.vim',
                \ 'html.vim',
                \ 'quickui.vim',
                \ 'theme.vim',
                \ 'coc.vim',
                \ 'keybindings.vim',
                \ ]
        call s:SourceConfig(s:config_file)
    endfor
else
    " If running in vscode, load vsinit.vim
    call s:SourceConfig('vsinit.vim')
endif

" Enable folding
set foldenable
set foldmethod=indent
set foldlevel=99

" Give more space for displaying messages at the bottom
set cmdheight=2

" Use file names as title of terminal while editing
set title

" Ignore certain file types and directories from fuzzy finding
set wildignore+=*.bmp,*.gif,*.ico,*.jpg,*.png,*.pdf,*.psd,*.hdr
set wildignore+=node_modules/*,target/*

" Make searches case insensitive
set ignorecase

" Override ignorecase option if search contains uppercase characters
set smartcase

" Use OS clipboard
set clipboard+=unnamedplus

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

" Enable 24-bit RGB color in the TUI
set termguicolors
