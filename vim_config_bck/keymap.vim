" turn off searh highlight
nnoremap <leader>n :nohlsearch<CR>

" spaec open/closes fold
nnoremap <space> za

" buffer mapings
" mappings for vertical split increment by 5 units
nnoremap + :exe "vertical resize " . (winwidth(0) * 9/8)<CR>
nnoremap _ :exe "vertical resize " . (-5)<CR>

" map :b# to <leader><space>
nmap <leader><space> :b#<CR>

" last pasted text
nnoremap gp `[v`]

" source vimrc
noremap <F5> :source $MYVIMRC<CR>

" nerdtree mapping
noremap <silent> <leader><CR> :Neotree toggle<CR>
noremap <silent> <leader>q :Neotree current reveal left<CR>

" Fugitive mapping
" map Gstatus
noremap <leader>gs :Gstatus<CR>

" fix for iterm under mac
nnoremap <BS> :TmuxNavigateLeft<CR>

" FZF mapings
" map <c-p> :Files<CR>
" map <c-b> :Buffers<CR>
" map <c-g><c-s> :GFiles?<CR>
nnoremap <c-p> <cmd>Telescope find_files<cr>
nnoremap <c-b> <cmd>Telescope buffers<cr>
nnoremap <leader>f <cmd>Telescope live_grep<cr>

noremap <silent> <leader>a<CR> :bufdo bw<CR>
