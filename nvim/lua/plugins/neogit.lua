return {
  "NeogitOrg/neogit",
  lazy = true, -- TODO map keys in yes object and remove this lazy bool
  dependencies = {
    "nvim-lua/plenary.nvim",         -- required
    "sindrets/diffview.nvim",        -- optional - Diff integration

    -- Only one of these is needed.
    "nvim-telescope/telescope.nvim", -- optional
  },
  config = true
}
