" vim-plug CONFIG
set nocompatible              " be iMproved, required
filetype off                  " required

call plug#begin('$HOME/.vim/bundle')

" Better directory view
Plug 'nvim-tree/nvim-web-devicons'
Plug 'nvim-tree/nvim-tree.lua'

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

" nvim-tree config
" Need to install ProtoNerdFont for icons in file list
nnoremap <silent> <C-n> :NvimTreeToggle<CR>
" Lua setup block
lua << EOF
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

require("nvim-tree").setup {
  on_attach = "default",
  hijack_cursor = false,
  auto_reload_on_write = true,
  disable_netrw = false,
  hijack_netrw = true,
  hijack_unnamed_buffer_when_opening = false,
  root_dirs = {},
  prefer_startup_root = false,
  sync_root_with_cwd = false,
  reload_on_bufenter = false,
  respect_buf_cwd = false,
  select_prompts = false,
  sort = {
    sorter = "name",
    folders_first = true,
    files_first = false,
  },
  view = {
    centralize_selection = false,
    cursorline = true,
    cursorlineopt = "both",
    debounce_delay = 15,
    side = "left",
    preserve_window_proportions = false,
    number = false,
    relativenumber = false,
    signcolumn = "yes",
    width = 30,
    float = {
      enable = false,
      quit_on_focus_loss = true,
      open_win_config = {
	relative = "editor",
	border = "rounded",
	width = 30,
	height = 30,
	row = 1,
	col = 1,
      },
    },
  },
  renderer = {
    add_trailing = false,
    group_empty = false,
    full_name = false,
    root_folder_label = ":~:s?$?/..?",
    indent_width = 2,
    special_files = { "Cargo.toml", "Makefile", "README.md", "readme.md" },
    hidden_display = "none",
    symlink_destination = true,
    decorators = { "Git", "Open", "Hidden", "Modified", "Bookmark", "Diagnostics", "Copied", "Cut", },
    highlight_git = "none",
    highlight_diagnostics = "none",
    highlight_opened_files = "none",
    highlight_modified = "none",
    highlight_hidden = "none",
    highlight_bookmarks = "none",
    highlight_clipboard = "name",
    indent_markers = {
      enable = false,
      inline_arrows = true,
      icons = {
	corner = "└",
	edge = "│",
	item = "│",
	bottom = "─",
	none = " ",
      },
    },
    icons = {
      web_devicons = {
	file = {
	  enable = true,
	  color = true,
	},
	folder = {
	  enable = false,
	  color = true,
	},
      },
      git_placement = "before",
      modified_placement = "after",
      hidden_placement = "after",
      diagnostics_placement = "signcolumn",
      bookmarks_placement = "signcolumn",
      padding = {
	icon = " ",
	folder_arrow = " ",
      },
      symlink_arrow = " ➛ ",
      show = {
	file = true,
	folder = true,
	folder_arrow = true,
	git = true,
	modified = true,
	hidden = false,
	diagnostics = true,
	bookmarks = true,
      },
      glyphs = {
	default = "",
	symlink = "",
	bookmark = "󰆤",
	modified = "●",
	hidden = "󰜌",
	folder = {
	  arrow_closed = "",
	  arrow_open = "",
	  default = "",
	  open = "",
	  empty = "",
	  empty_open = "",
	  symlink = "",
	  symlink_open = "",
	},
	git = {
	  unstaged = "✗",
	  staged = "✓",
	  unmerged = "",
	  renamed = "➜",
	  untracked = "★",
	  deleted = "",
	  ignored = "◌",
	},
      },
    },
  },
  hijack_directories = {
    enable = true,
    auto_open = true,
  },
  update_focused_file = {
    enable = false,
    update_root = {
      enable = false,
      ignore_list = {},
    },
    exclude = false,
  },
  system_open = {
    cmd = "",
    args = {},
  },
  git = {
    enable = true,
    show_on_dirs = true,
    show_on_open_dirs = true,
    disable_for_dirs = {},
    timeout = 400,
    cygwin_support = false,
  },
  diagnostics = {
    enable = false,
    show_on_dirs = false,
    show_on_open_dirs = true,
    debounce_delay = 500,
    severity = {
      min = vim.diagnostic.severity.HINT,
      max = vim.diagnostic.severity.ERROR,
    },
    icons = {
      hint = "",
      info = "",
      warning = "",
      error = "",
    },
  },
  modified = {
    enable = false,
    show_on_dirs = true,
    show_on_open_dirs = true,
  },
  filters = {
    enable = true,
    git_ignored = true,
    dotfiles = false,
    git_clean = false,
    no_buffer = false,
    no_bookmark = false,
    custom = {},
    exclude = {},
  },
  live_filter = {
    prefix = "[FILTER]: ",
    always_show_folders = true,
  },
  filesystem_watchers = {
    enable = true,
    debounce_delay = 50,
    ignore_dirs = {
      "/.ccls-cache",
      "/build",
      "/node_modules",
      "/target",
    },
  },
  actions = {
    use_system_clipboard = true,
    change_dir = {
      enable = true,
      global = false,
      restrict_above_cwd = false,
    },
    expand_all = {
      max_folder_discovery = 300,
      exclude = {},
    },
    file_popup = {
      open_win_config = {
	col = 1,
	row = 1,
	relative = "cursor",
	border = "shadow",
	style = "minimal",
      },
    },
    open_file = {
      quit_on_open = false,
      eject = true,
      resize_window = true,
      relative_path = true,
      window_picker = {
	enable = true,
	picker = "default",
	chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890",
	exclude = {
	  filetype = { "notify", "packer", "qf", "diff", "fugitive", "fugitiveblame" },
	  buftype = { "nofile", "terminal", "help" },
	},
      },
    },
    remove_file = {
      close_window = true,
    },
  },
  trash = {
    cmd = "gio trash",
  },
  tab = {
    sync = {
      open = false,
      close = false,
      ignore = {},
    },
  },
  notify = {
    threshold = vim.log.levels.INFO,
    absolute_path = true,
  },
  help = {
    sort_by = "key",
  },
  ui = {
    confirm = {
      remove = true,
      trash = true,
      default_yes = false,
    },
  },
  experimental = {
    multi_instance = false,
  },
  log = {
    enable = false,
    truncate = false,
    types = {
      all = false,
      config = false,
      copy_paste = false,
      dev = false,
      diagnostics = false,
      git = false,
      profile = false,
      watcher = false,
    },
  },
} -- END_DEFAULT_OPTS

