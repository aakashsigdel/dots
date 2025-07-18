return {
  'akinsho/git-conflict.nvim',
  version="*",
  config = function()
    vim.cmd("highlight DiffAdd guibg = '#2c3a4b'")
    vim.cmd("highlight DiffText guibg = '#2e403c'")
  end,
  opts = {
    default_mappings = true, -- disable buffer local mapping created by this plugin
    default_commands = true, -- disable commands created by this plugin
    disable_diagnostics = false, -- This will disable the diagnostics in a buffer whilst it is conflicted
    list_opener = 'copen', -- command or function to open the conflicts list
    highlights = { -- They must have background color, otherwise the default color will be used
      incoming = 'DiffAdd',
      current = 'DiffText',
    }
  }
}
