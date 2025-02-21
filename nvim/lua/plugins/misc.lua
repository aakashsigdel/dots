return {
  'RRethy/nvim-base16',
  'vim-scripts/BufOnly.vim',
  -- TODO: old
  'maxmellon/vim-jsx-pretty',
  -- TODO: old
  'gregsexton/MatchTag',
  'christoomey/vim-tmux-navigator',
  'tpope/vim-fugitive',
  'tpope/vim-surround',
  'tpope/vim-repeat',
  'David-Kunz/jester',
  {'AckslD/nvim-neoclip.lua', opts = {}},
  'HerringtonDarkholme/yats.vim',
  {
    'JoosepAlviste/nvim-ts-context-commentstring',
    opts = {
      enable = true,
      enable_autocmd = false,
    }
  },
  {
    'akinsho/bufferline.nvim',
    version="*",
    dependencies = { {'nvim-tree/nvim-web-devicons', opts = {}} } ,
    opts = {
      options = {
        diagnostics = "nvim_lsp",
        diagnostics_indicator = function(count, level, diagnostics_dict, context)
          local icon = level:match("error") and " " or " "
          return " " .. icon .. count
        end
      }
    }
  }
}
