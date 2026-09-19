# lua/hexide — Key binding files

This directory holds the OS key-character mapping layer. The three files below MUST
stay in sync — changing one means changing the others:

1. `../../alacritty.toml` (symlinked to `~/.config/alacritty/alacritty.toml`) —
   `[[keyboard.bindings]]` entries with `mods = "Command"` send a rare literal glyph.
   Glyphs in use: `←↓↑→` (pane movement), `µ` (`⌘g` git view), `√ ß ¡™£¢∞§¶•ª ≥˘≤¯
   ++ +- +f †` (misc), plus control codes (`\u0002`, `\u0014`, …).
2. `osKeyMap.lua` (this directory) — `mac_map` maps symbolic names (`CMD_h`) to the
   glyph macOS sends; `regular_map` (Linux) holds `<C-*>` equivalents.
3. `keymap.lua` (this directory) and per-plugin configs in `pluginConfig/` — consume
   `require("hexide.osKeyMap").mapping.CMD_x`. Never hard-code glyphs.

Consumers: `pluginConfig/neoTree.lua` (`⌘t`, `⌘g`), `pluginConfig/completion.lua`
(`⌘j/k`), `pluginConfig/legendaryPlugins.lua`, `pluginConfig/telescope.lua`.

## Rules

- New `⌘`-chord: add the Alacritty binding, a `CMD_x` entry in BOTH tables, and map
  `map.CMD_x` at the call site. Pick a glyph not listed in `../../alacritty.toml`.
- Linux has no `Cmd` — keep `regular_map` on `<C-*>` or native keys.
- Alacritty does not live-reload bindings: restart Alacritty after edits. nvim needs a
  restart too (config is held in memory).
- Check `../../aerospace.toml` `[mode.main.binding]` before assuming a `⌘`-chord is
  free — AeroSpace registers global hotkeys that run before Alacritty.
