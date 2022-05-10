# neovim configuration

**require**

- neovim version > 7.0, macOS system use `brew install --HEAD neovim` to install nightly neovim or select determined pre-built version at [neovim-release](https://github.com/neovim/neovim/releases/tag/v0.7.0)

## prepare

1. install language server

```bash
npm i -g typescript typescript-language-server diagnostic-languageserver
```

2. install command line tools

```bash
brew install fzf ripgrep
# suggest change default cl tool used by fzf.vim
brew install fd bat
```

3. install vim-plug

```bash
# neovim configuration dirs
mkdir -p ~/.config/nvim/autoload ~/.config/nvim/plugged

# install vim-plug
curl -fLo ~/.config/nvim/autoload/plug.vim  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
```

4. install plug

```bash
cd ~/.config/nvim
vim plug.vim
```

5. run neovim command

```vim
:PlugInstall
```

## .zshrc

some recomanded zshrc content

```zsh
# alias ls="lsd -al --group-dirs=first --blocks=permission,date,name --date=relative"
alias cat="bat --theme=OneHalfLight"
alias fvim="vim -o \`fzf\`"

export FZF_DEFAULT_COMMAND="fd --exclude={.git,.idea,.vscode,.sass-cache,node_modules,build} --type f -H"
export FZF_DEFAULT_OPTS="--height 60% --ansi --preview-window 'right:50%' --preview 'bat --color=always --theme=OneHalfLight --style=header,grid,numbers,changes --line-range :300 {}'"

export FZF_DEFAULT_OPTS=$FZF_DEFAULT_OPTS'
 --color=fg:#494b53,bg:#fafafa,hl:#a0a1a7
 --color=fg+:#494b53,bg+:#f0f0f0,hl+:#a626a4
 --color=info:#c18401,prompt:#d7005f,pointer:#a626a4
 --color=marker:#87ff00,spinner:#af5fff,header:#a626a4'
```

## Reference

1. [Linux 下 Neovim 配置 Python 开发环境指南](https://jdhao.github.io/2018/09/05/centos_nvim_install_use_guide/)
2. [How to set up Neovim 0.5 (LSP, Treesitter, fuzzy finder, etc)](https://www.youtube.com/watch?v=FW2X1CXrU1w)
