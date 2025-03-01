local map = require('utils').map

map('n', '<leader>n', ':nohlsearch<CR>') -- remove search highlight
map('n', '<space>', 'za') -- toggle fold
map('n', 'gp', '`[v`]') -- select last copied block
map('n', '<leader><space>', ':b#<CR>') -- open previous buffer
map('n', '<leader>o<CR>', ':BufOnly<CR>') -- close all other buffers
map('n', '<leader>a<CR>', ':%bd<CR><C-o') -- close all buffers
