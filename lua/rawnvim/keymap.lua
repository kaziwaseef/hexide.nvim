local opts = { noremap = true, silent = true }

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
	CMD_j = "<C-j>",
	CMD_k = "<C-k>",
	CMD_l = "<C-l>",
	CMD_h = "<C-h>",
	CMD_SHIFT_V = "√",
	CMD_SHIFT_S = "ß",
	CMD_slash = "<C-e>",
}

-- Copy to OS Clipboard
keymap("v", map.CMD_c, '"*y', opts)

-- Save with CMD_s
keymap("n", map.CMD_s, ":w<cr>", opts)
keymap("v", map.CMD_s, "<C-c>:w<cr>", opts)
keymap("i", map.CMD_s, "<C-c>:w<cr>", opts)

-- Move Lines
keymap("v", "J", ":m '>+1<CR>gv=gv", opts)
keymap("v", "K", ":m '<-2<CR>gv=gv", opts)

-- Splits
-- Movement
keymap("n", map.CMD_j, "<C-w><C-j>", opts)
keymap("n", map.CMD_k, "<C-w><C-k>", opts)
keymap("n", map.CMD_l, "<C-w><C-l>", opts)
keymap("n", map.CMD_h, "<C-w><C-h>", opts)
-- Make split
keymap("n", map.CMD_SHIFT_V, "<C-w><C-v>", opts)
keymap("n", map.CMD_SHIFT_S, "<C-w><C-s>", opts)

-- comment line
keymap('n', map.CMD_slash, 'gcc', {})
keymap('v', map.CMD_slash, 'gcgv', {})
keymap('i', map.CMD_slash, '<C-c>gcc', {})

vim.cmd([[
    fun! SetupCommandAlias(from, to)
        exec 'cnoreabbrev <expr> '.a:from
            \ .' ((getcmdtype() is# ":" && getcmdline() is# "'.a:from.'")'
            \ .'? ("'.a:to.'") : ("'.a:from.'"))'
    endfun
    call SetupCommandAlias("git","Git")
]])
