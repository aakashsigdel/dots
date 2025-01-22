local utils = require('utils')
local telescope_actions = require('telescope.actions.set')
local action_layout = require("telescope.actions.layout")
local builtin = require('telescope.builtin')
local themes = require('telescope.themes')

pcall(require('telescope').load_extension, 'fzf')

local fixfolds = {
   hidden = true,
   attach_mappings = function(_)
   telescope_actions.select:enhance({
      post = function()
      vim.cmd(':normal! zx')
      end,
   })
   return true
   end,
}

require("telescope").setup({
  defaults = {
    file_ignore_patterns = {'.vscode', '.idea', '.git'},
    mappings = {
      i = {
        ['<esc>'] = require('telescope.actions').close,
        ['<leader>?'] = action_layout.toggle_preview,
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

local telescope_last = 0
local function telescope_resume()
  if telescope_last == 0 then
    telescope_last = 1
    builtin.live_grep(themes.get_dropdown())
  else
    builtin.resume(themes.get_dropdown())
  end
end


  -- slightly brighter background to make the float pop more
  -- vim.api.nvim_set_hl(0, "FloatBorder", {bg="#3B4252", fg="#5E81AC"}) 
  -- vim.api.nvim_set_hl(0, "NormalFloat", {bg="#3B4252"})
  -- vim.api.nvim_set_hl(0, "TelescopeNormal", {bg="#3B4252"})
  -- vim.api.nvim_set_hl(0, "TelescopeBorder", {bg="#3B4252"})

-- Keymaps --
vim.keymap.set("n", "<c-p>", telescope_resume)
vim.keymap.set("n", "<leader>f", ":lua require('telescope').extensions.live_grep_args.live_grep_args()<CR>")

require("telescope").load_extension("ui-select")
require('telescope').load_extension('env')
