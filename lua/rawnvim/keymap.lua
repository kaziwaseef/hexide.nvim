local opts = { noremap = true, silent = true }

local term_opts = { silent = true }

-- Shorten function name
local keymap = vim.api.nvim_set_keymap

--Remap space as leader key
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Alacritty Map
local map = {
  CMD_c = "<C-y>",
  CMD_s = "<C-s>",
}

-- Copy to OS Clipboard
keymap("v", map.CMD_c, '"*y', opts)

-- Save with CMD_s
keymap("n", map.CMD_s, ':w<cr>', opts)
keymap("v", map.CMD_s, '<C-c>:w<cr>', opts)
keymap("i", map.CMD_s, '<C-c>:w<cr>', opts)

-- Move Lines
keymap("v", 'J', '<C-c>:w<cr>', opts)
keymap("v", 'K', '<C-c>:w<cr>', opts)

