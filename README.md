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
tmux source ~/.tmux.conf
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

Go to: https://github.com/alacritty/alacritty/releases
And download and install Alacritty

## Setup Alacritty

```bash
mkdir -p ${HOME}/.config/alacritty
ln -s $(pwd)/alacritty.yaml ${HOME}/.config/alacritty/alacritty.yaml
```

# Neo Vim Setup

## Add nvim config

```bash
mkdir -p ${HOME}/.config/nvim
ln -s $(pwd)/init.vim ${HOME}/.config/nvim/init.vim
```

## Install Plugins

### Add Vim Plug

```bash
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
```

### Install Plugins

```
nvim
:PlugInstall
```
