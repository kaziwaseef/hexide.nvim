# Hex-IDE with neovim (tmux and alacritty)

This is a full ide experience. This is not a neovim plugin.

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

### Prerequisites

Install: 
- Node
- ripgrep
- gnu-sed

## Install NeoVim

```bash
brew install neovim
```

## Add nvim config

```bash
mkdir -p ${HOME}/.config/nvim
ln -s $(pwd)/init.lua ${HOME}/.config/nvim/init.lua
ln -s $(pwd)/lua/ ${HOME}/.config/nvim/
ln -s $(pwd)/plugin/ ${HOME}/.config/nvim/
ln -s $(pwd)/lazygit.config.yaml ${HOME}/.config/nvim/lazygit.config.yaml
```

## Install Plugins

```
Open neovim to get plugins. Or run :Lazy command
```
