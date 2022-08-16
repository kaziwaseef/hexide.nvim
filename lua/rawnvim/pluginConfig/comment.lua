require('Comment').setup()

local opts = { noremap = true, silent = true }

local keymap = vim.api.nvim_set_keymap

-- Alacritty Map
local map = {
  CMD_slash = '<C-e>',
}

-- comment line
keymap('n', map.CMD_slash, 'gcc', opts)
