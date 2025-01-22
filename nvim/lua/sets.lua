vim.opt.syntax = 'enable'
vim.opt.termguicolors = true
-- vim.o.winbar = "%{%v:lua.require('modules/winbar').eval()%}"

vim.cmd [[
  syntax on
  set laststatus=2
  set hidden
  filetype plugin indent on

  set title
  set laststatus=0

  let mapleader=","
  let maplocalleader="-"

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
  set nofoldenable

  set hlsearch
  set ignorecase
  set smartcase
  set incsearch

  set timeoutlen=1000 ttimeoutlen=0
  set gdefault
  set list listchars=tab:»·,trail:·
  set mouse=a
  set noswapfile
  set noshowcmd
  let &fcs='eob: '
  set fillchars+=vert:\|

  let g:astro_typescript = 'enable'
]]
