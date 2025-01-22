return require('packer').startup(
  function(use)
    vim.cmd [[
      augroup YankHighlight
        autocmd!
        autocmd TextYankPost * silent! lua vim.highlight.on_yank()
      augroup end
    ]]
    use 'wbthomason/packer.nvim'

    use 'neovim/nvim-lspconfig' -- Collection of configurations for built-in LSP client
    use 'hrsh7th/nvim-cmp' -- Autocompletion plugin
    use 'hrsh7th/cmp-nvim-lsp' -- LSP source for nvim-cmp
    use 'saadparwaiz1/cmp_luasnip' -- Snippets source for nvim-cmp
    use 'L3MON4D3/LuaSnip' -- Snippets plugin

    use 'euclidianAce/BetterLua.vim'
    use 'leafgarland/typescript-vim'
    use 'maxmellon/vim-jsx-pretty'
    use 'gregsexton/MatchTag'
    use 'christoomey/vim-tmux-navigator'
    use 'tpope/vim-fugitive'
    use 'rking/ag.vim'
    use 'tomtom/tcomment_vim'
    use 'tpope/vim-surround'
    use 'kkoomen/vim-doge'
    use 'ryanoasis/vim-devicons'
    -- use 'ludovicchabant/vim-gutentags'
    use 'tpope/vim-repeat'
    use 'ggandor/lightspeed.nvim'
    use 'vimwiki/vimwiki'
    use 'jiangmiao/auto-pairs'

    -- treesitter
    use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }
    use 'RRethy/nvim-treesitter-textsubjects'

    -- neo-tree.nvim
    use 'nvim-neo-tree/neo-tree.nvim'
    use 'MunifTanjim/nui.nvim'

    -- Telesope.nvim
    use { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }
    use 'nvim-lua/plenary.nvim'
    use 'nvim-telescope/telescope.nvim'
    use 'kyazdani42/nvim-web-devicons'

    -- colors for vim
    use 'mhartington/oceanic-next'
    use 'overcache/NeoSolarized'
    use 'savq/melange'
  end
)
