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


local events = require("neo-tree.events")
---@class FileMovedArgs
---@field source string
---@field destination string

---@param args FileMovedArgs
local function on_file_remove(args)
  local ts_clients = vim.lsp.get_clients({ name = "ts_ls" })
  for _, ts_client in ipairs(ts_clients) do
    ts_client.request("workspace/executeCommand", {
      command = "_typescript.applyRenameFile",
      arguments = {
        {
          sourceUri = vim.uri_from_fname(args.source),
          targetUri = vim.uri_from_fname(args.destination),
        },
      },
    })
  end
end

require("neo-tree").setup({
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
  event_handlers = {
    {
      event = events.NEO_TREE_BUFFER_ENTER,
      handler = function()
        vim.wo.number = true
        vim.wo.relativenumber = true
      end,
    },
    {
      event = events.FILE_MOVED,
      handler = on_file_remove,
    },
    {
      event = events.FILE_RENAMED,
      handler = on_file_remove,
    },
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
})
