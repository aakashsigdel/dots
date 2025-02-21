local dev_icons = require('nvim-web-devicons')

local M = {}

vim.api.nvim_set_hl(0, 'WinBar', {italic = true})
vim.api.nvim_set_hl(0, 'WinBarModified', {fg = '#cf3838'})

local attach_hl_group = function(hl_group, text)
  return text == nil and '' or '%#' .. hl_group .. '#' .. text .. '%*  '
end

local eval_statusline = function(format_str)
  return vim.api.nvim_eval_statusline(format_str, {}).str
end

-- type len = 'long' | 'short'
local get_file_path = function()
  local file_path = eval_statusline('%f')
  return file_path:gsub('/', ' ➤  ')
end

local get_modified_flag = function()
  local modified_flag = vim.api.nvim_eval_statusline('%M', {}).str == '+' and '●' or ''
  return attach_hl_group('WinBarModified', modified_flag)
end

local get_icon = function()
  local filename = vim.fn.expand('%:t')
  local extension = vim.fn.expand('%:e')
  local icon, color = dev_icons.get_icon_color(filename, extension)
  local icon_str = icon == nil and '' or icon

  vim.api.nvim_set_hl(0, 'WinBarIcon', {fg = color})

  return attach_hl_group('WinBarIcon', '  ' .. icon_str)
end

function M.eval()
  local file_path = get_file_path()
  local modified_flag = get_modified_flag()
  local icon = get_icon()
  return icon
  .. file_path
  .. modified_flag
end

return M
