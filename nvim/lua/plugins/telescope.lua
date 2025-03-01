local utils = require('utils')

local fixfolds = {
   hidden = true,
   attach_mappings = function(_)
   require('telescope.actions.set').select:enhance({
      post = function()
      vim.cmd(':normal! zx')
      end,
   })
   return true
   end,
}

return {
  'nvim-telescope/telescope.nvim',
  dependencies = {
    { 'nvim-telescope/telescope-live-grep-args.nvim' },
    { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
    'nvim-lua/plenary.nvim',
    'nvim-telescope/telescope-ui-select.nvim' ,
    'LinArcX/telescope-env.nvim',
  },
  config = function()
    pcall(require("telescope").load_extension, "fzf")
    vim.api.nvim_set_hl(0, "FloatBorder", {bg="#3B4252", fg="#5E81AC"})
    vim.api.nvim_set_hl(0, "TelescopeBorder", {bg="#3B4252"})
    local telescope = require('telescope')
    telescope.load_extension("live_grep_args")
    telescope.setup({
      defaults = {
        file_ignore_patterns = {'.vscode', '.idea', '.git'},
        mappings = {
          i = {
            ['<esc>'] = require('telescope.actions').close,
            ['<leader>?'] = require("telescope.actions.layout").toggle_preview,
            ['<C-j>'] = require('telescope.actions').cycle_history_next,
            ['<C-k>'] = require('telescope.actions').cycle_history_prev,
          },
          n = {
            ['<esc>'] = require('telescope.actions').close,
          },
        }
      },
      pickers = {
        buffers = utils.extend({
          sort_lastused = true,
          previewer = false,
        }, fixfolds),
        file_browser = fixfolds,
        find_files = utils.extend({previewer = false}, fixfolds),
        git_files = fixfolds,
        grep_string = fixfolds,
        live_grep = utils.extend(fixfolds, {additional_args = function(opts) return {"--hidden"} end}),
      }
    })

    require("telescope").load_extension("ui-select")
    require('telescope').load_extension('env')
    require('telescope').load_extension('fzf')
    require('telescope').load_extension('neoclip')
  end,
  keys = {
    {'<leader>f', ":lua require('telescope').extensions.live_grep_args.live_grep_args()<cr>"},
    {'<c-p>', '<cmd>Telescope find_files<cr>'},
    {'<leader>tgs', '<cmd>Telescope git_status<cr>'},
    {'<c-b>', "<cmd>Telescope buffers<cr>"},
    {'<leader>tc', '<cmd>Telescope commands<cr>'},
    {'<C-LeftMouse>', '<cmd>Telescope lsp_definitions<CR>'},
    {'<leader>cs', '<cmd>Telescope neoclip<cr>'},
  }
}
