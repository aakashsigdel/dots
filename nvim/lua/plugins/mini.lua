return {
  { 'echasnovski/mini.pairs', version = '*', opts = {} },
  { 'echasnovski/mini.indentscope', version = '*', opts = {} },
  {
    'echasnovski/mini.hipatterns', version = '*',
    opts = function()
      return {
        highlighters = {
          -- Highlight standalone 'FIXME', 'HACK', 'TODO', 'NOTE'
          fixme = { pattern = '%f[%w]()FIXME()%f[%W]', group = 'MiniHipatternsFixme' },
          hack  = { pattern = '%f[%w]()HACK()%f[%W]',  group = 'MiniHipatternsHack'  },
          todo  = { pattern = '%f[%w]()TODO()%f[%W]',  group = 'MiniHipatternsTodo'  },
          note  = { pattern = '%f[%w]()NOTE()%f[%W]',  group = 'MiniHipatternsNote'  },

          -- Highlight hex color strings (`#rrggbb`) using that color
          hex_color = require('mini.hipatterns').gen_highlighter.hex_color(),
        },
      }
    end
  },
  {
    'echasnovski/mini.comment', version = '*',
    opts = {
      options = {
        custom_commentstring = function()
          return require('ts_context_commentstring.internal').calculate_commentstring() or vim.bo.commentstring
        end,
      },
    }
  },
}
