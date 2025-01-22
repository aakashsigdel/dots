local M = {}

function M.extend(t1, t2)
  if t1 == nil and t2 == nil then
    return {}
  end
  if t1 == nil then
    return t2
  end
  if t2 == nil then
    return t1
  end
  return vim.tbl_extend('force', t1, t2)
end

function M.map(mode, lhs, rhs, opts)
  local options = { noremap = true }
  if opts then
      options = vim.tbl_extend("force", options, opts)
  end
  vim.keymap.set(mode, lhs, rhs, options)
end

function M.alert(message)
  require('notify')(message, "info", {title = "Alert"}, 'warn')
end

function M.show_default_statusline()
  vim.cmd("set statusline=")
end

return M
