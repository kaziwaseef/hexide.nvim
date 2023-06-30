require("spectre").setup()

local opts = { noremap = true, silent = true }
local keymap = vim.api.nvim_set_keymap

-- Alacritty Map
local map = require("hexide.osKeyMap").mapping

keymap("n", map.CMD_f, '<cmd>lua require("spectre").open()<CR>', opts)
keymap("n", "<leader>sw", '<cmd>lua require("spectre").open_visual({select_word=true})<CR>', opts)
keymap("v", "<leader>sw", '<esc><cmd>lua require("spectre").open_visual()<CR>', opts)
keymap("n", "<leader>sp", '<cmd>lua require("spectre").open_file_search({select_word=true})<CR>', opts)
