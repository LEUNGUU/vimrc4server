" common settings
set synmaxcol=1000
set modeline
set report=0
set lazyredraw " to avoid scrolling problems
set pastetoggle=<F2>
" set nowrap
set hls
set nocompatible
set mouse=nv
set encoding=utf-8
set visualbell
set fileformats=unix,dos,mac
set virtualedit=block
set formatoptions+=1

" vim directory
let $DATA_PATH = expand(($XDG_CACHE_HOME ? $XDG_CACHE_HOME : '~/.cache') . '/vim')
set undofile swapfile nobackup
set directory=$DATA_PATH/swap//,$DATA_PATH,~/tmp,/var/tmp,/tmp
set undodir=$DATA_PATH/undo//,$DATA_PATH,~/tmp,/var/tmp,/tmp
set backupdir=$DATA_PATH/backup/,$DATA_PATH,~/tmp,/var/tmp,/tmp
set viewdir=$DATA_PATH/view/

" if sudo, disable vim swap/backup/undo/shada/viminfo writing
if $SUDO_USER !=# '' && $USER !=# $SUDO_USER
		\ && $HOME !=# expand('~'.$USER)
		\ && $HOME ==# expand('~'.$SUDO_USER)

	set noswapfile
	set nobackup
	set nowritebackup
	set noundofile
	if has('nvim')
		set shada="NONE"
	else
		set viminfo="NONE"
	endif
endif

" History saving
set history=1000
if has('nvim')
	set shada='300,<50,@100,s10,h
else
	set viminfo='300,<10,@50,h,n$DATA_PATH/viminfo
endif

" clipboard
if has('clipboard')
	set clipboard& clipboard+=unnamedplus
endif

" Wildmenu
if has('wildmenu')
	" set nowildmenu
	" set wildmode=list:longest,full
	" set wildoptions=tagfile
	" set wildignorecase
	set wildignore+=.git,.hg,.svn,.stversions,*.pyc,*.spl,*.o,*.out,*~,%*
	set wildignore+=*.jpg,*.jpeg,*.png,*.gif,*.zip,**/tmp/**,*.DS_Store
	set wildignore+=**/node_modules/**,**/bower_modules/**,*/.sass-cache/*
	set wildignore+=application/vendor/**,**/vendor/ckeditor/**,media/vendor/**
	set wildignore+=__pycache__,*.egg-info,.pytest_cache
endif

 " Tabs and Indents
" set textwidth=120    " Text width maximum chars before wrapping
set noexpandtab     " Don't expand tabs to spaces.
set tabstop=2       " The number of spaces a tab is
set softtabstop=2   " While performing editing operations
set shiftwidth=2    " Number of spaces to use in auto(indent)
set smarttab        " Tab insert blanks according to 'shiftwidth'
set autoindent      " Use same indenting on new lines
set smartindent     " Smart autoindenting on new lines
set shiftround      " Round indent to multiple of 'shiftwidth'

" searching
set ignorecase      " Search ignoring case
set smartcase       " Keep case when searching with *
set infercase       " Adjust case in insert completion mode
set incsearch       " Incremental search
set wrapscan        " Searches wrap around the end of the file
set showmatch       " Jump to matching bracket
set matchpairs+=<:> " Add HTML brackets to pair matching
set matchtime=1     " Tenths of a second to show the matching paren
set cpoptions-=m    " showmatch will wait 0.5s or until a char is typed
set showfulltag     " Show tag and tidy search in completion
"set complete=.      " No wins, buffs, tags, include scanning

if exists('+inccommand')
	set inccommand=nosplit
endif

" Behavior {{{
" --------
set nowrap                      " No wrap by default
set linebreak                   " Break long lines at 'breakat'
set breakat=\ \	;:,!?           " Long lines break chars
set nostartofline               " Cursor in same column for few commands
set whichwrap+=h,l,<,>,[,],~    " Move to following line on certain keys
set splitbelow splitright       " Splits open bottom right
set switchbuf=useopen,usetab    " Jump to the first open window in any tab
set switchbuf+=vsplit           " Switch buffer behavior to vsplit
set backspace=indent,eol,start  " Intuitive backspacing in insert mode
set diffopt=filler,iwhite       " Diff mode: show fillers, ignore whitespace
set completeopt=menuone         " Always show menu, even for one item
set completeopt+=noselect       " Do not select a match in the menu

if has('patch-7.4.775')
	" Do not insert any text for a match until the user selects from menu
	set completeopt+=noinsert
endif

if has('patch-8.1.0360') || has('nvim-0.4')
	set diffopt+=internal,algorithm:patience
	" set diffopt=indent-heuristic,algorithm:patience
endif

" }}}
" Editor UI {{{
" --------------------
set noshowmode          " Don't show mode in cmd window
set shortmess=aoOTI     " Shorten messages and don't show intro
set scrolloff=2         " Keep at least 2 lines above/below
set sidescrolloff=5     " Keep at least 5 lines left/right
set number            " Don't show line numbers
set noruler             " Disable default status ruler
set list                " Show hidden characters

set showtabline=2       " Always show the tabs line
set winwidth=30         " Minimum width for active window
set winminwidth=10      " Minimum width for inactive windows
set winheight=4         " Minimum height for active window
set winminheight=1      " Minimum height for inactive window
set pumheight=15        " Pop-up menu's line height
set helpheight=12       " Minimum help window height
set previewheight=12    " Completion preview height

set showcmd             " Show command in status line
set cmdheight=2         " Height of the command line
set cmdwinheight=5      " Command-line lines
set equalalways         " Resize windows on split or close
set laststatus=2        " Always show a status line
set colorcolumn=120      " Highlight the 80th character limit
set display=lastline

" UI Symbols
" icons:  ▏│ ¦ ╎ ┆ ⋮ ⦙ ┊ 
set showbreak=↪
set listchars=tab:\▏\ ,extends:⟫,precedes:⟪,nbsp:␣,trail:·
"set fillchars=vert:▉,fold:─
" For python
autocmd bufnewfile *.py call HeaderPython()
function! HeaderPython()
    call setline(1, "#!/usr/bin/env python3")
    call setline(2, "# -*- coding: utf-8 -*-")
    normal G
    normal o
    normal o
    call setline(5, "if __name__ == '__main__':")
    call setline(6, "    pass")
endfunc

" For shell
autocmd bufnewfile *.sh call HeaderSh()
function! HeaderSh()
    call setline(1, "#!/usr/bin/env bash")
    normal G
    normal o
    normal o
endfunc


" For json
autocmd FileType json syntax match Comment +\/\/.\+$+
let mapleader=";"
inoremap <leader>w <Esc>:w<cr>
nnoremap <leader>x :w\|bd<cr>
" ,e
inoremap jj <Esc>
" Capital letter
nnoremap <C-S-U> gUiw
inoremap <C-S-U> <Esc>gUiwgi

" use ctrl+h/j/k/l switch window
noremap <C-h> <C-w>h
noremap <C-j> <C-w>j
noremap <C-k> <C-w>k
noremap <C-l> <C-w>l

" use :Q exit
map :Q :q
map <M-q> :q<Cr>

" switch between buffers
nnoremap <leader>l :bp<cr>
nnoremap <leader>k :bn<cr>

" tab complete
set tags=tags
set autochdir

function! CleverTab()
  if strpart( getline('.'), 0, col('.')-1 ) =~ '^\s*$'
    return "\<Tab>"
  elseif strpart( getline('.'), col('.')-2, 2) =~ '\s$'
    return "\<Tab>"
  else
    return "\<C-N>"
  endif
endfunction
inoremap <Tab> <C-R>=CleverTab()<CR>