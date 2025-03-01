vim.diagnostic.config({
  signs = {
    text = {
      [vim.diagnostic.severity.ERROR] = 'x',
      [vim.diagnostic.severity.WARN] = 'w',
      [vim.diagnostic.severity.INFO] = 'i',
      [vim.diagnostic.severity.HINT] = 'h',
    }
  },
})

return {
  'nvim-neo-tree/neo-tree.nvim',
  branch = "v3.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    {"nvim-tree/nvim-web-devicons", opts = {}},
    "MunifTanjim/nui.nvim",
    {"antosha417/nvim-lsp-file-operations", opts = {}}
    -- {"3rd/image.nvim", opts = {}},
  },
  opts = {
    filesystem = {
      window = {
        mappings = {
          -- disable fuzzy finder 
          ["/"] = "noop",
          ["o"] = "system_open",
        }
      }
    },
    commands = {
      system_open = function(state)
        local node = state.tree:get_node()
        local path = node:get_id()
        vim.fn.jobstart({ "open", path }, { detach = true })
      end
    },
    default_component_configs = {
      git_status = {
        symbols = {
          -- Change type
          added     = "✚", -- or "✚", but this is redundant info if you use git_status_colors on the name
          modified  = "•", -- or "", but this is redundant info if you use git_status_colors on the name
          deleted   = "✖",-- this can only be used in the git_status source
          renamed   = "🡺",-- this can only be used in the git_status source
          -- Status type
          untracked = "?",
          ignored   = "☒",
          unstaged  = "☐",
          staged    = "☑",
          conflict  = "",
        }
      }
    }
  },
  config = function(_, opts)
    vim.cmd([[ let g:neo_tree_remove_legacy_commands = 1 ]])
    local events = require("neo-tree.events")
    opts.event_handlers = opts.event_handlers or {}
    vim.list_extend(opts.event_handlers, {
      {
        event = events.NEO_TREE_BUFFER_ENTER,
        handler = function()
          vim.wo.number = true
          vim.wo.relativenumber = true
        end,
      },
    })
    require("neo-tree").setup(opts)
  end,
  keys = {
    {'<leader><CR>', '<cmd>Neotree toggle<CR>'},
    {'<leader>q', '<cmd>Neotree reveal<CR>'}
  }
}
