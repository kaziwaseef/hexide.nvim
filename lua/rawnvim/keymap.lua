local opts = { noremap = true, silent = true }

-- Shorten function name
local keymap = vim.api.nvim_set_keymap

--Remap space as leader key
keymap("", "<Space>", "<Nop>", opts)
keymap("i", "<Tab>", "<Tab>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Alacritty Map
local map = require("rawnvim.osKeyMap").mapping

-- Copy to OS Clipboard
keymap("v", map.CMD_c, '"*y', opts)

-- Write Buffer
keymap("n", "<leader>s", ":w<cr>", opts)

-- Move Lines
keymap("v", "J", ":m '>+1<CR>gv=gv", opts)
keymap("v", "K", ":m '<-2<CR>gv=gv", opts)

-- Splits
-- Movement
keymap("n", map.OPT_j, "<C-w><C-j>", opts)
keymap("n", map.OPT_k, "<C-w><C-k>", opts)
keymap("n", map.OPT_l, "<C-w><C-l>", opts)
keymap("n", map.OPT_h, "<C-w><C-h>", opts)
-- Make split
keymap("n", map.CMD_SHIFT_V, "<C-w><C-v>", opts)
keymap("n", map.CMD_SHIFT_S, "<C-w><C-s>", opts)

-- Eslint
keymap("n", "<leader>ee", "<cmd>e %<CR>", opts)

vim.cmd([[
    fun! SetupCommandAlias(from, to)
        exec 'cnoreabbrev <expr> '.a:from
            \ .' ((getcmdtype() is# ":" && getcmdline() is# "'.a:from.'")'
            \ .'? ("'.a:to.'") : ("'.a:from.'"))'
    endfun
    call SetupCommandAlias("git","Git")
]])
