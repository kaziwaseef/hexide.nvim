# config-files

Config files for my environment

# Tmux Setup

tmux is used as a multiplexer to run nvim and have persistent sessions

## Install tmux

```bash
brew install tmux
```

## Setup tpm

```bash
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
```

## Setup tmux config

```bash
ln -s $(pwd)/.tmux.conf ${HOME}/.tmux.conf
```

### Setup Plugins

```
tmux
<prefix>I
```

# Alacritty Setup

## Install Font

Install the custom Nerdfont from font directory in this repository

## Install Alacritty

```bash
brew install --cask alacritty
```

## Setup Alacritty

```bash
mkdir -p ${HOME}/.config/alacritty
```

```bash
ln -s $(pwd)/alacritty.yml ${HOME}/.config/alacritty/alacritty.yml
```

# Neo Vim Setup

## Install NeoVim

```bash
brew install neovim
```

## Add nvim config

```bash
mkdir -p ${HOME}/.config/nvim
```

```bash
ln -s $(pwd)/init.vim ${HOME}/.config/nvim/init.vim
```

## Install Plugins

### Add Vim Plug

```bash
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
```

### Prerequisites

Install Node, Yarn.

For Watchman,

```bash
brew install watchman
```

For ripgrep

```bash
brew install ripgrep
```

For Typos:

```bash
cargo install typos-cli
```

### Install Plugins

```
nvim
:PlugInstall
```

## Setup CoC

Settings config

```bash
ln -s $(pwd)/coc-settings.json ${HOME}/.config/nvim/coc-settings.json
```

Open nvim and run:

```
:CocInstall coc-json coc-tsserver coc-eslint coc-css
```

### Graphql

Install cli

```bash
npm i -g graphql-language-service-cli
```
