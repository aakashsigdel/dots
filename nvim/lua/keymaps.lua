local map = require('utils').map

map('n', '<leader>n', ':nohlsearch<CR>')
map('n', '<space>', 'za')
map('n', 'gp', '`[v`]')
map('n', '<leader><space>', ':b#<CR>')
map('n', '<leader>a<CR>', ':bufdo bw<CR>', {silent = true})

map('n', '<leader><CR>', '<cmd>Neotree toggle<CR>', {silent = true})
map('n', '<leader>q', '<cmd>Neotree reveal<CR>', {silent = true})

map('n', '<c-p>', '<cmd>Telescope find_files<cr>')
map('n', '<c-b>', '<cmd>Telescope buffers<cr>')
map('n', '<leader>tc', '<cmd>Telescope commands<cr>')
-- map('n', '<leader>f', '<cmd>Telescope live_grep<cr>')
map('n', '<leader>h', '<cmd>Telescope git_files<cr>')

map('n', '<leader>gs', ':Gstatus<CR>')
map('n', '<leader>rv', ':source ~/.config/nvim/init.lua<CR>')
map('t', '<C-[>', [[<C-\><C-n>]])

map('n', '<leader>o', ':%bd<CR><C-o')

map('n', '<leader>bc', 'let @+ = expand("%:p")')
