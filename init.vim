" Fundamentals "{{{
" ---------------------------------------------------------------------
autocmd!
scriptencoding utf-8

" incremental substitution (neovim)
if has('nvim')
  set inccommand=split
endif

set encoding=utf-8
set title
set number
set wildmenu
set nowrap
set nowrapscan
set autoindent

set showmatch
set hlsearch
set incsearch
set ignorecase
set smartcase

syntax on
filetype plugin on

set expandtab
set ai
set sw=4
set ts=4
set sts=4

" file types
au BufNewFile,BufRead *.es6 setf javascript
" TypeScript
au BufNewFile,BufRead *.tsx setf typescriptreact
" Markdown
au BufNewFile,BufRead *.md set filetype=markdown
au BufNewFile,BufRead *.mdx set filetype=markdown
" Flow
au BufNewFile,BufRead *.flow set filetype=javascript
" Fish
au BufNewFile,BufRead *.fish set filetype=fish

set suffixesadd=.js,.es,.jsx,.json,.css,.less,.sass,.styl,.php,.py,.md

autocmd FileType vim,typescriptreact,javascriptreact,tsx,jsx,less,scss,javascript,html,css,xml,typescript,ruby,coffee,yaml,json set sw=2 ts=2 sts=2

set backspace=2

"}}}

runtime ./plug.vim

" cross platform "{{{
" ---------------------------------------------------------------------
if has("unix")
  let s:uname = system("uname -s")
  " Do Mac stuff
  if s:uname == "Darwin\n"
    runtime ./macos.vim
  endif
endif
if has('win32')
  runtime ./windows.vim
endif

runtime ./maps.vim

"}}}

" theme "{{{
" ---------------------------------------------------------------------
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

runtime ./colors/one.vim
set background=light        " for the light version
let g:airline_theme='one'
let g:one_allow_italics = 1 " I love italic for comments
colorscheme one

"}}}

set exrc

" vim: set foldmethod=marker foldlevel=0:

