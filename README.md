# my_neovim

## prepare

install language server

```bash
npm i -g typescript typescript-language-server
```

install vim-plug

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

## Reference

1. [Linux 下 Neovim 配置 Python 开发环境指南](https://jdhao.github.io/2018/09/05/centos_nvim_install_use_guide/)
2. [How to set up Neovim 0.5 (LSP, Treesitter, fuzzy finder, etc)](https://www.youtube.com/watch?v=FW2X1CXrU1w)
