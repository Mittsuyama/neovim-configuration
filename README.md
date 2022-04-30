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


## Theme

```vim
" plugin
Plug 'joshdick/onedark.vim'

" use
" ------------------------------------------------------------------------------------------------------------------------------------------
" ----------------------------------------------------------------- Themes -----------------------------------------------------------------
" ------------------------------------------------------------------------------------------------------------------------------------------

"Use 24-bit (true-color) mode in Vim/Neovim when outside tmux.
"If you're using tmux version 2.2 or later, you can remove the outermost $TMUX check and use tmux's 24-bit color support
"(see < http://sunaku.github.io/tmux-24bit-color.html#usage > for more information.)
if (empty($TMUX))
  if (has("nvim"))
    "For Neovim 0.1.3 and 0.1.4 < https://github.com/neovim/neovim/pull/2198 >
    let $NVIM_TUI_ENABLE_TRUE_COLOR=1
  endif
  "For Neovim > 0.1.5 and Vim > patch 7.4.1799 < https://github.com/vim/vim/commit/61be73bb0f965a895bfb064ea3e55476ac175162 >
  "Based on Vim patch 7.4.1770 (`guicolors` option) < https://github.com/vim/vim/commit/8a633e3427b47286869aa4b96f2bfc1fe65b25cd >
  " < https://github.com/neovim/neovim/wiki/Following-HEAD#20160511 >
  if (has("termguicolors"))
    set termguicolors
  endif
endif

" use onedark
syntax on
colorscheme onedark
```

## Other Blog

![https://jdhao.github.io/2018/09/05/centos_nvim_install_use_guide/](https://jdhao.github.io/2018/09/05/centos_nvim_install_use_guide/)
