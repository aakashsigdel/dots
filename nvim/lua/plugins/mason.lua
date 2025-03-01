return {
  {
    'williamboman/mason-lspconfig.nvim',
    opts = {
      ensure_installed = { 'ts_ls', 'lua_ls', 'eslint' },
    },
    dependencies = {
      {'williamboman/mason.nvim', opts = {
        ui = {
          border = "rounded"
        }
      }}
    }
  }
}
