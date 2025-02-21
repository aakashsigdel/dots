local map = require('utils').map

map('n', '<leader>n', ':nohlsearch<CR>')
map('n', '<space>', 'za')
map('n', 'gp', '`[v`]')
map('n', '<leader><space>', ':b#<CR>')
map('n', '<leader>0<CR>', ':BufOnly<CR>')
map('n', '<leader>a<CR>', ':%bd<CR><C-o')
map('t', '<C-[>', [[<C-\><C-n>]])
map('n', '<leader>bc', 'let @+ = expand("%:p")')
