return {
  "NeogitOrg/neogit",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "sindrets/diffview.nvim",
    "nvim-telescope/telescope.nvim",
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
