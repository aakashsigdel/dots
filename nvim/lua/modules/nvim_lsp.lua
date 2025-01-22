local builtin = require('telescope.builtin')
local utils = require('utils')
local nvim_lsp = require('lspconfig')
local extend = utils.extend

local capabilities = require('cmp_nvim_lsp').default_capabilities()
local rounded_border = {border = 'rounded'}

local goto_next = function(severity)
  local options = extend({ float = rounded_border}, {severity = severity, count = 1, float = true})
  return function (opts)
    return vim.diagnostic.jump(extend(options, opts))
  end
end

local goto_prev = function(severity)
  local options = extend({ float = rounded_border}, {severity = severity, count = -1, float = true})
  return function (opts)
    return vim.diagnostic.jump(extend(options, opts))
  end
end

vim.lsp.handlers['textDocument/hover'] = vim.lsp.with(vim.lsp.handlers.hover, rounded_border)

local opts = { noremap=true, silent=true }
vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, opts)
vim.keymap.set('n', '<leader>k', goto_prev(vim.diagnostic.severity.ERROR), opts)
vim.keymap.set('n', '<leader>j', goto_next(vim.diagnostic.severity.ERROR), opts)
vim.keymap.set('n', '<leader>wk', goto_prev({max = vim.diagnostic.severity.WARN}), opts)
vim.keymap.set('n', '<leader>wj', goto_next({max = vim.diagnostic.severity.WARN}), opts)

local on_attach = function(_, bufnr)
  local bufopts = { noremap=true, silent=true, buffer=bufnr }
  vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
  vim.keymap.set('n', 'gr', vim.lsp.buf.references, bufopts)
  vim.keymap.set('n', 'gr', builtin.lsp_references, opts)
  vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts)
  vim.keymap.set('n', '<leader>h', vim.lsp.buf.hover, bufopts)
  vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, bufopts)
  vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, bufopts)
end

local on_attach_ts = function(_, bufnr)
  on_attach(_, bufnr)

  local bufopts = { noremap=true, silent=true, buffer=bufnr }
  vim.keymap.set('n', '<leader>trf', '<cmd>TypescriptRenameFile<cr>', bufopts)
  vim.keymap.set('n', '<leader>tgs', '<cmd>TypescriptGoToSourceDefinition<cr>', bufopts)
  vim.keymap.set('n', '<leader>toi', '<cmd>OrganiseImports<CR>', extend(bufopts, {desc = 'Organize imports'}))
  vim.keymap.set('n', '<leader>tai', '<cmd>AddMissingImports<CR>', extend(bufopts, {desc = 'Add missing imports'}))
  vim.keymap.set('n', '<leader>tui', '<cmd>RemoveUnusedImports<CR>', extend(bufopts, {desc = 'Remove unused imports'}))
end

local function add_missing_imports()
  vim.lsp.buf.code_action({
    apply = true,
    context = { only = { "source.addMissingImports.ts" } },
  })
end

local function organise_imports()
  vim.lsp.buf.code_action({
    apply = true,
    context = { only = { "source.organizeImports" } },
  })
end

local function remove_unused_imports()
  vim.lsp.buf.code_action({
    apply = true,
    context = { only = { "source.removeUnused.ts" } },
  })
end

nvim_lsp.ts_ls.setup{
  server = capabilities,
  on_attach = on_attach_ts,
  commands = {
    OrganiseImports = {organise_imports, 'Organise imports'},
    AddMissingImports = {add_missing_imports, 'Add missing imports'},
    RemoveUnusedImports = {remove_unused_imports, 'Remove unused imports'}
  }
}

-- local vtsls_ts_opts = {
--   updateImportsOnFileMove = { enabled = "always" },
--   suggest = {
--     completeFunctionCalls = true,
--   },
--   inlayHints = {
--     enumMemberValues = { enabled = true },
--     functionLikeReturnTypes = { enabled = true },
--     parameterNames = { enabled = "literals" },
--     parameterTypes = { enabled = true },
--     propertyDeclarationTypes = { enabled = true },
--     variableTypes = { enabled = false },
--   },
-- }


-- https://www.lazyvim.org/extras/lang/typescript
-- nvim_lsp.vtsls.setup {
--   server = capabilities,
--   filetypes = {
--     "javascript",
--     "javascriptreact",
--     "javascript.jsx",
--     "typescript",
--     "typescriptreact",
--     "typescript.tsx",
--   },
--   settings = {
--     complete_function_calls = true,
--     vtsls = {
--       enableMoveToFileCodeAction = true,
--       autoUseWorkspaceTsdk = true,
--       experimental = {
--         maxInlayHintLength = 30,
--         completion = {
--           enableServerSideFuzzyMatch = true,
--         },
--       },
--     },
--     typescript = vtsls_ts_opts,
--     javascript = vtsls_ts_opts
--   },
--   commands = {
--     OrganiseImports = {organise_imports, 'Organise imports'},
--     AddMissingImports = {add_missing_imports, 'Add missing imports'},
--     RemoveUnusedImports = {remove_unused_imports, 'Remove unused imports'}
--   },
--   on_attach = function(client, buffer)
--     on_attach_ts(client, buffer)
--
--     client.commands["_typescript.moveToFileRefactoring"] = function(command)
--       ---@type string, string, lsp.Range
--       local action, uri, range = unpack(command.arguments)
--
--       local function move(newf)
--         client.request("workspace/executeCommand", {
--           command = command.command,
--           arguments = { action, uri, range, newf },
--         })
--       end
--
--       local fname = vim.uri_to_fname(uri)
--       client.request("workspace/executeCommand", {
--         command = "typescript.tsserverRequest",
--         arguments = {
--           "getMoveToRefactoringFileSuggestions",
--           {
--             file = fname,
--             startLine = range.start.line + 1,
--             startOffset = range.start.character + 1,
--             endLine = range["end"].line + 1,
--             endOffset = range["end"].character + 1,
--           },
--         },
--       }, function(_, result)
--         ---@type string[]
--         local files = result.body.files
--         table.insert(files, 1, "Enter new path...")
--         vim.ui.select(files, {
--           prompt = "Select move destination:",
--           format_item = function(f)
--             return vim.fn.fnamemodify(f, ":~:.")
--           end,
--         }, function(f)
--           if f and f:find("^Enter new path") then
--             vim.ui.input({
--               prompt = "Enter move destination:",
--               default = vim.fn.fnamemodify(fname, ":h") .. "/",
--               completion = "file",
--             }, function(newf)
--               return newf and move(newf)
--             end)
--           elseif f then
--             move(f)
--           end
--         end)
--       end)
--     end
--   end
-- }

nvim_lsp.denols.setup {
  on_attach = on_attach,
  root_dir = nvim_lsp.util.root_pattern("deno.json", "deno.jsonc"),
}

nvim_lsp.eslint.setup{}
nvim_lsp.astro.setup{}

nvim_lsp.lua_ls.setup {
  server = {
    capabilities = capabilities,
    on_attach = on_attach
  },
  settings = {
    Lua = {
      runtime = { version = 'LuaJIT' },
      diagnostics = { globals = {'vim'} },
      workspace = { library = vim.api.nvim_get_runtime_file("", true) },
      telemetry = { enable = false },
    },
  },
}

vim.opt.completeopt = {'menu', 'menuone', 'noselect'}

require'cmp'.setup({
  window = {
    completion = require'cmp'.config.window.bordered(),
    documentation = require'cmp'.config.window.bordered(),
  },
  mapping = require'cmp'.mapping.preset.insert({
    ['<C-d>'] = require'cmp'.mapping.scroll_docs(-4),
    ['<C-f>'] = require'cmp'.mapping.scroll_docs(4),
    ['<CR>'] = require'cmp'.mapping.confirm({ select = true }),
  }),
  sources = require'cmp'.config.sources({
    { name = 'nvim_lsp' },
    { name = 'path' },
    { name = 'luasnip' },
  }, {
    { name = 'buffer' },
  }),
  formatting = {
    format = require'lspkind'.cmp_format()
  }
})

require'cmp'.setup.filetype('gitcommit', {
  sources = require'cmp'.config.sources({
    { name = 'cmp_git' },
  }, {
    { name = 'buffer' },
  })
})

require'lspconfig'.terraformls.setup{}
