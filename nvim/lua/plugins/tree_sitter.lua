return {
  'nvim-treesitter/nvim-treesitter',
  build = ':TSUpdate',
  dependencies = {
    'RRethy/nvim-treesitter-textsubjects',
    'nvim-treesitter/playground'
  },
  opts = {
    textsubjects = {
      enable = true,
      prev_selection = ',', -- (Optional) keymap to select the previous selection
      keymaps = {
        ['.'] = 'textsubjects-smart',
        [';'] = 'textsubjects-container-outer',
        ['i;'] = 'textsubjects-container-inner',
      },
    },
  },
  config = function()
    vim.opt.foldmethod = "expr"
    vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
    local configs = require("nvim-treesitter.configs")
    configs.setup({
      sync_install = false,
      highlight = { enable = true },
      indent = { enable = false },
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
        "jsonc",
        "vim",
        "regex",
        "lua",
        "markdown",
        "markdown_inline",
        "gitcommit",
        "gitignore",
        "tmux",
        "diff",
      },
    })
  end
}
