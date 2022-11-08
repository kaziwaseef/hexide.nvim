require("vgit").setup()

local opts = { noremap = true, silent = true }

local keymap = vim.api.nvim_set_keymap

local map = require("rawnvim.osKeyMap").mapping

keymap("n", "<leader>gh", ":VGit buffer_history_preview<CR>", opts)
