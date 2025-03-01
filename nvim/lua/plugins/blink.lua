return {
  'saghen/blink.cmp',
  dependencies = {
    {
      'xzbdmw/colorful-menu.nvim',
      config = function ()
        require("colorful-menu").setup({
          ls = { ts_ls = { extra_info_hl = "@comment" }, fallback = true, fallback_extra_info_hl = "@comment" },
          fallback_highlight = "@variable"
        })
      end
    }
  },
  version = '*',
  opts = {
    keymap = { preset = 'enter' },
    appearance = { use_nvim_cmp_as_default = true },
    cmdline = { enabled = false },
    sources = {
      default = { 'lsp', 'path', 'buffer' },
    },
    signature = { enabled = true },
    completion = {
      menu = {
        border = 'rounded',
        draw = {
          columns = { { "kind_icon" }, { "label", gap = 1 } },
          components = {
            label = {
              text = function(ctx)
                return require("colorful-menu").blink_components_text(ctx)
              end,
              highlight = function(ctx)
                return require("colorful-menu").blink_components_highlight(ctx)
              end
            },
          }
        }
      },
      accept = { auto_brackets = { enabled = false }, },
      documentation = { auto_show = true, auto_show_delay_ms = 500, window = { border = 'rounded' } },
    },
  },
  opts_extend = { "sources.default" }
}
