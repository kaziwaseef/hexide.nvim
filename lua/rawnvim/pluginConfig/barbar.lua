local opts = { noremap = true, silent = true }

local keymap = vim.api.nvim_set_keymap

-- Alacritty Map
local map = require("rawnvim.osKeyMap").mapping

-- Move Between Buffers
keymap("n", map.CMD_comma, ":BufferPrevious<CR>", opts)
keymap("n", map.CMD_period, ":BufferNext<CR>", opts)

-- Move Buffers
keymap("n", map.CMD_SHIFT_comma, ":BufferMovePrevious<CR>", opts)
keymap("n", map.CMD_SHIFT_period, ":BufferMoveNext<CR>", opts)

-- Move to Buffer 1-9
keymap("n", map.CMD_1, ":BufferGoto 1<CR>", opts)
keymap("n", map.CMD_2, ":BufferGoto 2<CR>", opts)
keymap("n", map.CMD_3, ":BufferGoto 3<CR>", opts)
keymap("n", map.CMD_4, ":BufferGoto 4<CR>", opts)
keymap("n", map.CMD_5, ":BufferGoto 5<CR>", opts)
keymap("n", map.CMD_6, ":BufferGoto 6<CR>", opts)
keymap("n", map.CMD_7, ":BufferGoto 7<CR>", opts)
keymap("n", map.CMD_8, ":BufferGoto 8<CR>", opts)
keymap("n", map.CMD_9, ":BufferLast<CR>", opts)

-- Pin
keymap("n", map.OPT_p, ":BufferPin<CR>", opts)

-- Close
keymap("n", map.OPT_w, ":BufferClose<CR>", opts)
