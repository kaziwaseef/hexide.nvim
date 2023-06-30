local opts = { noremap = true, silent = true }

-- Shorten function name
local keymap = vim.api.nvim_set_keymap

--Remap space as leader key
keymap("", "<Space>", "<Nop>", opts)
keymap("i", "<Tab>", "<Tab>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Alacritty Map
local map = require("hexide.osKeyMap").mapping

vim.cmd([[
vnoremap <expr> j v:count ? 'j' : 'gj'
vnoremap <expr> k v:count ? 'k' : 'gk'
nnoremap <expr> j v:count ? 'j' : 'gj'
nnoremap <expr> k v:count ? 'k' : 'gk'
]])

keymap("n", "<leader>ru", ":! python3 ~/Documents/runner.py &<CR>", opts)
-- Copy to OS Clipboard
keymap("v", map.CMD_c, '"*y', opts)
-- Keep cursor in the same place for yank
keymap("v", "y", "ygv<Esc>", opts)

-- Select all
keymap("n", map.CMD_a, "ggVG", opts)
keymap("v", map.CMD_a, "<Esc>ggVG", opts)

-- Write Buffer
keymap("n", "<leader>s", ":w<CR>", opts)

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

-- Reload File
keymap("n", "<leader>ee", "<cmd>e %<CR>", opts)

-- Toggle Highlight
keymap("n", "<leader>h", ":noh<CR>", opts)

-- Indent Selected Lines
keymap("v", ">", ">gv", opts)
keymap("v", "<", "<gv", opts)

-- Close All Buffers except current
keymap("n", "<leader>cb", "<cmd>%bd|e#<cr>", opts)

vim.cmd([[
    fun! SetupCommandAlias(from, to)
        exec 'cnoreabbrev <expr> '.a:from
            \ .' ((getcmdtype() is# ":" && getcmdline() is# "'.a:from.'")'
            \ .'? ("'.a:to.'") : ("'.a:from.'"))'
    endfun
    call SetupCommandAlias("git","Git")
]])
