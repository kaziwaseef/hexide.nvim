# hexide.nvim — Notes for Agents

Personal Neovim config. Runs inside Alacritty + tmux on macOS, window-managed by AeroSpace.

## Topic guides

- [lua/hexide/AGENTS.md](lua/hexide/AGENTS.md) — **read this before touching any key
  binding**: the Alacritty→Neovim char-forwarding scheme, the files that must stay in
  sync, and verification gotchas.

## Conventions

- Leader key is `<Space>`.
- `lua/hexide/option.lua` — global options; `lua/hexide/keymap.lua` — base keymaps;
  `lua/hexide/pluginConfig/*` — one file per plugin.

## Gotchas

- Running nvim holds config in memory; after editing config files the user must
  restart nvim (and Alacritty for binding changes) before behavior changes.
- Lua Syntax-check with `luajit -bl <file> > /dev/null` (one file per command; a second
  path is treated as the bytecode OUTPUT file and gets overwritten).
