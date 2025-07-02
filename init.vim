" Locate python in windows environment
if has('win64') || has('win32') || has('win16')
    let g:python3_host_prog = '~/AppData/Local/miniconda3/envs/neovim/python.exe'
endif

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

" source plugins.init to load plugins before loading other config files
if has('win32') || has('win16')
    source $HOME\AppData\Local\nvim\plugins.vim
else
    source ~/.config/nvim/plugins.vim
endif

" source vim configuration files
" After plugins have loaded to prevent errors
if has('win32') || has('win16')
    source $HOME\AppData\Local\nvim\format.vim
    source $HOME\AppData\Local\nvim\html.vim
    source $HOME\AppData\Local\nvim\keybindings.vim
    source $HOME\AppData\Local\nvim\quickui.vim
    source $HOME\AppData\Local\nvim\theme.vim
else
    source ~/.config/nvim/format.vim
    source ~/.config/nvim/html.vim
    source ~/.config/nvim/keybindings.vim
    source ~/.config/nvim/quickui.vim
    source ~/.config/nvim/theme.vim
endif

" Enable folding
set foldenable
set foldmethod=indent
set foldlevel=99

" Give more space for displaying messages
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

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

" Enable 24-bit RGB color in the TUI
set termguicolors
