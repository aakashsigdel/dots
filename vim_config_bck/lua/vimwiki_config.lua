local M = {}

local SUCCESS_CODE = '0'
local FAILURE_CODE = '1'
local success = 'echo -n ' .. SUCCESS_CODE
local failure = 'echo -n ' ... FAILURE_CODE

local wikiPath = "~/vimwiki/"

function M.openProjectWiki()
  local dir_name = vim.api.nvim_exec(":echo fnamemodify(execute('pwd'), ':p:t')", true)
  local path = wikiPath .. dir_name

  local config = {path = path, syntax = 'markdown', ext = '.md'}

  local command = "test -e " .. path .. " && " .. success .. "|| " ..failure
  local cmd_result = vim.api.nvim_call_function('system', {command})

  if(cmd_result == SUCCESS_CODE) then
    vim.g.vimwiki_list = {config}
  else
    vim.api.nvim_call_function('system', {'mkdir ' .. dir_name})
    vim.g.vimwiki_list = {config}
  end
end
