-- local map = require('utils').map
-- local jester = require('jester')

-- -- remove the file name form the $file path and cd into that dir; then cut the extension from file name before running test
-- local dir = "`sed 's/\\/[^/]*$//' <<< $file`"
-- local cmd_run_file = "cd ".. dir .. " && yarn jest `echo $file | cut -f 1 -d '.'`"
-- local cmd_run = cmd_run_file .. " -t '$result'"
-- local cmd_watch = cmd_run_file .. ' --watch'

-- map('n', '<leader>tf', function() jester.run_file({cmd = cmd_run_file}) end)
-- map('n', '<leader>tr', function() jester.run({cmd = cmd_run}) end)
-- map('n', '<leader>tw', function() jester.run_file({ cmd = cmd_watch }) end)

return {
  {
    'David-Kunz/jester',
    lazy = true,
    opts = {
      -- cmd = "jest -t '$result' -- $file",
      path_to_jest_run = 'yarn jest'
    },
    keys= {
      {'<leader>tf', function() require"jester".run_file() end, desc = 'Run test for a file'},
      {'<leader>tr', function() require"jester".run() end, desc = 'Run a single test'},
    }
  }
}
