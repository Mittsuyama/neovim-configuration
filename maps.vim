let mapleader = ";"

" --- save and exit ---
map <leader>q :q<cr>
map <leader>Q :q!<cr>
map <leader>w :w<cr>
map <leader>W :wq<cr>

" --- tab ---
map <leader>tn :tabnew<cr>
map <leader>to :tabonly<cr>
map <leader>tc :tabclose<cr>
map <leader>tm :tabmove
map <leader>t<leader> :tabnext

" --- fuzzy find ---
nmap <C-p> :Files<CR>
nmap <C-e> :Buffers<CR>
let g:fzf_action = { 'ctrl-e': 'edit' }

" --- Resize window ---
nmap <C-w><left> <C-w><
nmap <C-w><right> <C-w>>
nmap <C-w><up> <C-w>+
nmap <C-w><down> <C-w>-
