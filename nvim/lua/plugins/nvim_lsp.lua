local utils = require('utils')
local extend = utils.extend

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
vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with( vim.lsp.handlers.signature_help, rounded_border)

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
  vim.keymap.set('n', 'gr', require('telescope.builtin').lsp_references, opts)
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


return {
  'neovim/nvim-lspconfig',
  dependencies = { 'saghen/blink.cmp' },
  opts = {
      servers = {
      ts_ls = {
        on_attach = on_attach_ts,
        commands = {
          OrganiseImports = {organise_imports, 'Organise imports'},
          AddMissingImports = {add_missing_imports, 'Add missing imports'},
          RemoveUnusedImports = {remove_unused_imports, 'Remove unused imports'}
        }
      },
      lua_ls = {
        on_attach = on_attach,
        settings = {
          Lua = {
            runtime = { version = 'LuaJIT' },
            diagnostics = { globals = {'vim'} },
            workspace = { library = vim.api.nvim_get_runtime_file("", true) },
            telemetry = { enable = false },
          },
        },
      },
      eslint = {},
    }
  },
  config = function(_, opts)
    vim.opt.completeopt = {'menu', 'menuone', 'noselect'}
    local lspconfig = require('lspconfig')
    for server, config in pairs(opts.servers) do
      config.capabilities = require('blink.cmp').get_lsp_capabilities(config.capabilities)
      lspconfig[server].setup(config)
    end
  end
}


-- nvim_lsp.denols.setup {
--   on_attach = on_attach,
--   root_dir = nvim_lsp.util.root_pattern("deno.json", "deno.jsonc"),
-- }
