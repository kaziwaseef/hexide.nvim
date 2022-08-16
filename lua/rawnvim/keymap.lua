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
  CMD_SHIFT_J = "<C-j>",
  CMD_SHIFT_K = "<C-k>",
  CMD_SHIFT_L = "<C-l>",
  CMD_SHIFT_H = "<C-h>",
  CMD_SHIFT_V = '√',
  CMD_SHIFT_S = 'ß',
}

-- Copy to OS Clipboard
keymap("v", map.CMD_c, '"*y', opts)

-- Save with CMD_s
keymap("n", map.CMD_s, ':w<cr>', opts)
keymap("v", map.CMD_s, '<C-c>:w<cr>', opts)
keymap("i", map.CMD_s, '<C-c>:w<cr>', opts)

-- Move Lines
keymap("v", 'J', ":m '>+1<CR>gv=gv", opts)
keymap("v", 'K', ":m '<-2<CR>gv=gv", opts)

-- Splits
-- Movement
keymap("n", map.CMD_SHIFT_J, "<C-w><C-j>", opts)
keymap("n", map.CMD_SHIFT_K, "<C-w><C-k>", opts)
keymap("n", map.CMD_SHIFT_L, "<C-w><C-l>", opts)
keymap("n", map.CMD_SHIFT_H, "<C-w><C-h>", opts)
-- Make split
keymap("n", map.CMD_SHIFT_V, "<C-w><C-v>", opts)
keymap("n", map.CMD_SHIFT_S, "<C-w><C-s>", opts)
