" ------------------------------------------------------------------------------------------------------------------------------------------ 
" ----------------------------------------------------------------- Basics -----------------------------------------------------------------
" ------------------------------------------------------------------------------------------------------------------------------------------
set nowrap
:let mapleader = ";"

" ---------------- cursor ------------------
set number
set cul

" ---------------- innner search ----------------
set showmatch
set incsearch
set ignorecase
set wildmenu

" ---------------- different indent depends on file type with space ----------------
set expandtab
set ai
set sw=4
set ts=4
set sts=4
autocmd FileType typescriptreact,javascriptreact,less,scss,javascript,html,css,xml,typescript set ai
autocmd FileType typescriptreact,javascriptreact,less,scss,javascript,html,css,xml,typescript set sw=2
autocmd FileType typescriptreact,javascriptreact,less,scss,javascript,html,css,xml,typescript set ts=2
autocmd FileType typescriptreact,javascriptreact,less,scss,javascript,html,css,xml,typescript set sts=2

" -------------- fix a little bug ----------------
set backspace=2

" -------------- use system clipboar ----------------
set clipboard+=unnamedplus







" ------------------------------------------------------------------------------------------------------------------------------------------
" --------------------------------------------------------------- Plugins ------------------------------------------------------------------
" ------------------------------------------------------------------------------------------------------------------------------------------


" ---------------- plugins ----------------
call plug#begin('~/.config/nvim/plugged')
" ---------------- basic plugins ----------------
Plug 'Yggdroot/LeaderF', { 'do': ':LeaderfInstallCExtension' }
Plug 'preservim/nerdtree'
Plug 'joshdick/onedark.vim'
Plug 'pangloss/vim-javascript'
Plug 'leafgarland/typescript-vim'
Plug 'peitalin/vim-jsx-typescript'
Plug 'styled-components/vim-styled-components', { 'branch': 'main' }
Plug 'jparise/vim-graphql'
" ---------------- pro plugins ----------------
" coc
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'neoclide/coc-tsserver'
Plug 'neoclide/coc-eslint'
call plug#end()

" ---------------- highlight for large files ----------------
autocmd BufEnter *.{js,jsx,ts,tsx} :syntax sync fromstart
autocmd BufLeave *.{js,jsx,ts,tsx} :syntax sync clear


" ---------------- NerdTree ----------------
nnoremap <leader>n :NERDTreeFocus<CR>
nnoremap <C-n> :NERDTree<CR>
nnoremap <C-t> :NERDTreeToggle<CR>
nnoremap <C-f> :NERDTreeFind<CR>

" ---------------- LeaderF ----------------
" don't show the help in normal mode
let g:Lf_HideHelp = 1
let g:Lf_UseCache = 0
let g:Lf_UseVersionControlTool = 0
let g:Lf_IgnoreCurrentBufferName = 1
" popup mode
let g:Lf_WindowPosition = 'popup'
let g:Lf_PreviewInPopup = 1
let g:Lf_StlSeparator = { 'left': "\ue0b0", 'right': "\ue0b2", 'font': "DejaVu Sans Mono for Powerline" }
let g:Lf_PreviewResult = {'Function': 0, 'BufTag': 0 }

" ignore files
let g:Lf_WildIgnore={'file':['.DS_Store', '*.vcxproj'],'dir':['node_modules']}

let g:Lf_ShortcutF = "<leader>ff"
noremap <leader>fb :<C-U><C-R>=printf("Leaderf buffer %s", "")<CR><CR>
noremap <leader>fm :<C-U><C-R>=printf("Leaderf mru %s", "")<CR><CR>
noremap <leader>ft :<C-U><C-R>=printf("Leaderf bufTag %s", "")<CR><CR>
noremap <leader>fl :<C-U><C-R>=printf("Leaderf line %s", "")<CR><CR>

" search visually selected text literally
xnoremap gf :<C-U><C-R>=printf("Leaderf! rg -F -e %s ", leaderf#Rg#visual())<CR>
noremap go :<C-U>Leaderf! rg --recall<CR>

" should use `Leaderf gtags --update` first
let g:Lf_GtagsAutoGenerate = 0
let g:Lf_Gtagslabel = 'native-pygments'
noremap <leader>fr :<C-U><C-R>=printf("Leaderf! gtags -r %s --auto-jump", expand("<cword>"))<CR><CR>
noremap <leader>fd :<C-U><C-R>=printf("Leaderf! gtags -d %s --auto-jump", expand("<cword>"))<CR><CR>
noremap <leader>fo :<C-U><C-R>=printf("Leaderf! gtags --recall %s", "")<CR><CR>
noremap <leader>fn :<C-U><C-R>=printf("Leaderf gtags --next %s", "")<CR><CR>
noremap <leader>fp :<C-U><C-R>=printf("Leaderf gtags --previous %s", "")<CR><CR>


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

