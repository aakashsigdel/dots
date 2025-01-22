local api = vim.api

-- highlight yank gorup
local yankGrp = api.nvim_create_augroup("YankHighlight", { clear = true })
api.nvim_create_autocmd("TextYankPost", {
  command = "silent! lua vim.highlight.on_yank()",
  group = yankGrp,
})

-- set file types
api.nvim_create_autocmd(
  {"BufNewFile", "BufRead"},
  {pattern = ".babelrc", command = "setlocal filetype=json"}
)

api.nvim_create_autocmd(
  {"BufNewFile", "BufRead"},
  {pattern = ".eslintrc", command = "setlocal filetype=json"}
)

api.nvim_create_autocmd(
  {"BufNewFile", "BufRead"},
  {pattern = "*.js", command = "setlocal filetype=javascript.jsx"}
)

api.nvim_create_autocmd(
  {"BufNewFile", "BufRead"},
  {pattern = "*.jsx", command = "setlocal filetype=javascript.jsx"}
)

api.nvim_create_autocmd(
  {"BufNewFile", "BufRead"},
  {pattern = "*.tsx", command = "setlocal filetype=typescript.tsx"}
)

api.nvim_create_autocmd("BufWritePre", {
  pattern = "*",
  callback = function(args)
    require("conform").format({ bufnr = args.buf })
  end,
})

