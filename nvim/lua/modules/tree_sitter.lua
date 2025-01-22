local vim = vim
local opt = vim.opt

opt.foldmethod = "expr"
opt.foldexpr = "nvim_treesitter#foldexpr()"

require'nvim-treesitter.configs'.setup {
  highlight = {
    enable = true,
  },
  indent = {
    enable = false,
  },
  ensure_installed = {
    "typescript",
    "tsx",
    "javascript",
    "html",
    "css",
    "yaml",
    "swift",
    "java",
    "bash",
    "json",
    "jsonc"
  },
  textsubjects = {
    enable = true,
    prev_selection = ',', -- (Optional) keymap to select the previous selection
    keymaps = {
      ['.'] = 'textsubjects-smart',
      [';'] = 'textsubjects-container-outer',
      ['i;'] = 'textsubjects-container-inner',
    },
  }
}
require('ts_context_commentstring').setup {
  enable = true,
  enable_autocmd = false,
}
