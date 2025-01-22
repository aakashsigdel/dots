local ls = require'luasnip'
local types = require'luasnip.util.types'

require("luasnip/loaders/from_vscode").lazy_load()
ls.config.set_config {
  updateevents = 'TextChanged, TextChangedI',
  ext_opts = {
    [types.choiceNode] = {
      active = {
        virt_text = { { '', 'Error' } }
      }
    }
  }
}

vim.keymap.set({'i', 's'}, '<M-n>', function ()
  if ls.expand_or_jumpable() then
    ls.expand_or_jump()
  end
end, {silent = true})

vim.keymap.set({'i', 's'}, '<M-p>', function ()
  if ls.jumpable(-1) then
    ls.jump(-1)
  end
end, {silent = true})

vim.keymap.set('n', '<leader><leader>s', '<cmd>source ~/.dotfiles/nvim/lua/modules/luasnip.lua<CR>')

ls.filetype_extend("javascript", {"javascript", "jsdoc", "next-ts", "react-ts", "typescript"})
ls.snippets = {
  all = {
    ls.parser.parse_snippet('expand', '-- this is a crazy one')
  }
}
