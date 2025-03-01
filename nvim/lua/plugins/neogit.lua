local telescope = require "telescope"
return {
  "NeogitOrg/neogit",
  dependencies = {
    "nvim-lua/plenary.nvim",         -- required
    "sindrets/diffview.nvim",        -- optional - Diff integration

    -- Only one of these is needed.
    "nvim-telescope/telescope.nvim", -- optional
  },
  keys = {
    {'<leader>g', '<cmd>:Neogit kind=floating<cr>'},
  },
  opts = {
    integrations = {
      diffview = true,
      telescope = true
    }
  },
  config = true
}
