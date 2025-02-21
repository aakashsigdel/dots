return {
  'saghen/blink.cmp',
  version = '*',
  opts = {
    keymap = { preset = 'enter' },
    appearance = { use_nvim_cmp_as_default = true },
    cmdline = { enabled = false },
    sources = {
      default = { 'lsp', 'path', 'buffer' },
    }
  },
  opts_extend = { "sources.default" }
}
