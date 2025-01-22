syntax on
set laststatus=2
set hidden
filetype plugin indent on

let mapleader=","

" set undofile for undo persistance when navigating between buffers
set undofile
set undodir=$HOME/.vim/undo


set nu
set rnu
set tabstop=2 softtabstop=2 shiftwidth=2 expandtab
set shiftround
set smarttab
set copyindent



set colorcolumn=100
set cursorline
set wildmenu
set lazyredraw
set nocursorcolumn
set nocursorline
syntax sync minlines=100
syntax sync maxlines=240
set synmaxcol=900

set foldmethod=expr
set foldexpr=nvim_treesitter#foldexpr()
set foldlevel=0
set foldlevelstart=99

set hlsearch
set ignorecase
set smartcase
set incsearch

" set sane timeouts
set timeoutlen=1000 ttimeoutlen=0
setlocal spell spelllang=en_us
set gdefault
set list listchars=tab:»·,trail:·
set mouse=a
set noswapfile
set noshowcmd
let &fcs='eob: '
set fillchars+=vert:\|
