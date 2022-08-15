require('Comment').setup()

local opts = { noremap = true, silent = true }

local keymap = vim.api.nvim_set_keymap

-- Alacritty Map
local map = {
  CMD_slash = '<C-e>',
}

keymap('n', map.CMD_slash, '<C-e> gcc', opts)
keymap('v', map.CMD_slash, '<C-e> gcgv', opts)
keymap('i', map.CMD_slash, '<C-e> <C-c>gc', opts)
