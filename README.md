# my_neovim

## init neovim

### install

```bash
# macos
brew install neovim
# ubuntu
sudo apt-get install neovim
```

### vim-plug

```bash
# neovim configuration dirs
mkdir -p ~/.config/nvim/autoload ~/.config/nvim/plugged

# install vim-plug
curl -fLo ~/.config/nvim/autoload/plug.vim  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
```

plug syntax

```vim
call plug#begin('~/.config/nvim/plugged')

Plug 'xxxx/xxxx'

call plug#end()
```

run install plug, run neovim command

```vim
:PlugInstall
```

## Plugs

```vim
" ----------------------- plugins -----------------------
call plug#begin('~/.config/nvim/plugged')
" ----------------------- basic plugins -----------------------
Plug 'pangloss/vim-javascript'
Plug 'leafgarland/typescript-vim'
Plug 'peitalin/vim-jsx-typescript'
Plug 'styled-components/vim-styled-components', { 'branch': 'main' }
Plug 'jparise/vim-graphql'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
" ----------------------- pro plugins -----------------------
" coc
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'neoclide/coc-tsserver'
" eslint
Plug 'neoclide/coc-eslint'
call plug#end()

" ----------------------- highlight for large files -----------------------
autocmd BufEnter *.{js,jsx,ts,tsx} :syntax sync fromstart
autocmd BufLeave *.{js,jsx,ts,tsx} :syntax sync clear

" ----------------------- coc -----------------------
let g:coc_global_extensions = [
  \ 'coc-tsserver'
  \ ]
 
" ----------------------- eslint -----------------------
if isdirectory('./node_modules') && isdirectory('./node_modules/eslint')
  let g:coc_global_extensions += ['coc-eslint']
endif

" ----------------------- Tool tip documentation and diagnostics -----------------------
function! ShowDocIfNoDiagnostic(timer_id)
  if (coc#float#has_float() == 0 && CocHasProvider('hover') == 1)
    silent call CocActionAsync('doHover')
  endif
endfunction

function! s:show_hover_doc()
  call timer_start(500, 'ShowDocIfNoDiagnostic')
endfunction

autocmd CursorHoldI * :call <SID>show_hover_doc()
autocmd CursorHold * :call <SID>show_hover_doc()

" ----------------------- navigation -----------------------
" goto definition
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gr <Plug>(coc-references)
" jump error
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)
" diagnostics list
nnoremap <silent> <space>d :<C-u>CocList diagnostics<cr>
" fuzzy search
nnoremap <silent> <space>s :<C-u>CocList -I symbols<cr>
" performing code aciton
nmap <leader>do <Plug>(coc-codeaction)
" renaming a symbol
nmap <leader>rn <Plug>(coc-rename)
```



