" use iterm colorschem
let g:fzf_colors =
\ { 'fg':      ['fg', 'Normal'],
  \ 'bg':      ['bg', 'Normal'],
  \ 'hl':      ['fg', 'Comment'],
  \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
  \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
  \ 'hl+':     ['fg', 'Statement'],
  \ 'info':    ['fg', 'PreProc'],
  \ 'border':  ['fg', 'Ignore'],
  \ 'prompt':  ['fg', 'Conditional'],
  \ 'pointer': ['fg', 'Exception'],
  \ 'marker':  ['fg', 'Keyword'],
  \ 'spinner': ['fg', 'Label'],
  \ 'header':  ['fg', 'Comment'] }

let $FZF_DEFAULT_COMMAND = "fd --exclude={.git,.idea,.vscode,.sass-cache,node_modules,build} --type f -H"
let $FZF_DEFAULT_OPTS = "--height 60% --ansi --preview-window 'right:50%' --preview 'bat --color=always --theme=OneHalfLight --style=header,grid,numbers,changes --line-range :300 {}'"
let $FZF_PREVIEW_COMMAND = "bat --color=always --theme=OneHalfLight --style=header,grid,numbers,changes --line-range :300 {}"

"{{{ backup
" preview window custom style
" command! -bang -nargs=? -complete=dir Files
"   \ call fzf#run(fzf#wrap({
"   \ 'source': 'fd --exclude={.git,.idea,.vscode,.sass-cache,node_modules,build} --type f -H',
"   \ 'sink': 'e',
"   \ }))

" command! -bang -nargs=* Rg
"   \ call fzf#run(fzf#wrap({
"   \ 'source': 'rg --column --line-number --no-heading --color=always --smart-case -- '.shellescape(<q-args>),
"   \ 'sink': 'e',
"   \}))

" command! -bang -nargs=? -complete=dir Files
"    \ call fzf#run(<q-args>, {'options': ['--layout=reverse', '--info=inline', '--preview-window', 'right:50%', '--preview', 'bat --color=always --theme=OneHalfLight --style=header,grid,numbers,changes --line-range :300 {}']}, <bang>0)
" command! -bang -nargs=* Rg
"   \ call fzf#vim#grep(
"  \   'rg --column --line-number --no-heading --color=always --smart-case --preview-window \"right:50%\" --preview \"\"  -- '.shellescape(<q-args>), 1,
"  \   fzf#vim#with_preview(), <bang>0)
"}}}

" key bindings
let g:fzf_action = {
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-x': 'split',
  \ 'ctrl-v': 'vsplit' }
nnoremap <leader>g :Rg<CR>

" vim: set foldmethod=marker foldlevel=0:
