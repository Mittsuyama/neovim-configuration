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
map <leader>tm :tabmove<cr>
map <leader>tt :tabnext<cr>

" --- fuzzy find ---
nmap <C-p> :FZF<CR>
nmap <C-e> :Buffers<CR>
let g:fzf_action = { 'ctrl-e': 'edit' }
