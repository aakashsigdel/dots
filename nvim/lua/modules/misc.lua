-- vim-jsx option to enable for js files too
vim.g.jsx_ext_required = 0

vim.cmd [[
  set diffopt+=vertical
  let g:prettier#autoformat = 1
  let g:prettier#autoformat_config_present = 1
  let g:prettier#autoformat_require_pragma = 0
  let g:prettier#exec_cmd_async = 1
  colorscheme base16-onedark
]]
