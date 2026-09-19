local map = require("hexide.osKeyMap").mapping

-- Base keymaps live here so legendary registers AND lists them (single source of truth).
-- Leader setup itself stays in keymap.lua because it must run before plugins load.
local keymaps = {
	-- Wrap-aware j/k (real j/k with a count, gj/gk otherwise)
	{ "j", "v:count ? 'j' : 'gj'", description = "Move down (wrap-aware)", opts = { expr = true } },
	{ "k", "v:count ? 'k' : 'gk'", description = "Move up (wrap-aware)", opts = { expr = true } },
	{ "j", "v:count ? 'j' : 'gj'", description = "Move down (wrap-aware)", mode = "v", opts = { expr = true } },
	{ "k", "v:count ? 'k' : 'gk'", description = "Move up (wrap-aware)", mode = "v", opts = { expr = true } },

	-- Copy / yank
	{ map.CMD_c, '"*y', description = "Copy to OS clipboard", mode = "v", opts = { silent = true } },
	{ "y", "ygv<Esc>", description = "Yank, keep selection", mode = "v", opts = { silent = true } },

	-- Select all
	{ map.CMD_a, "ggVG", description = "Select all", opts = { silent = true } },
	{ map.CMD_a, "<esc>ggVG", description = "Select all", mode = "v", opts = { silent = true } },

	-- Write Buffer
	{ "<leader>s", "<cmd>w<cr>", description = "Save file", opts = { silent = true } },

	-- Move Lines
	{ "J", "<cmd>m '>+1<cr>gv=gv", description = "Move lines down", mode = "v", opts = { silent = true } },
	{ "K", "<cmd>m '<-2<cr>gv=gv", description = "Move lines up", mode = "v", opts = { silent = true } },

	-- Splits
	-- Movement
	{ map.CMD_SHIFT_J, "<C-w><C-j>", description = "Go to split below", opts = { silent = true } },
	{ map.CMD_SHIFT_K, "<C-w><C-k>", description = "Go to split above", opts = { silent = true } },
	{ map.CMD_SHIFT_L, "<C-w><C-l>", description = "Go to split right", opts = { silent = true } },
	{ map.CMD_SHIFT_H, "<C-w><C-h>", description = "Go to split left", opts = { silent = true } },
	-- Make split
	{ map.CMD_SHIFT_V, "<C-w><C-v>", description = "Vertical split", opts = { silent = true } },
	{ map.CMD_SHIFT_S, "<C-w><C-s>", description = "Horizontal split", opts = { silent = true } },

	-- Reload File
	{ "<leader>ee", "<cmd>e %<cr>", description = "Reload file", opts = { silent = true } },

	-- Toggle Highlight
	{ "<leader>h", "<cmd>noh<cr>", description = "Clear search highlight", opts = { silent = true } },

	-- Indent Selected Lines
	{ ">", ">gv", description = "Indent, keep selection", mode = "v", opts = { silent = true } },
	{ "<", "<gv", description = "Outdent, keep selection", mode = "v", opts = { silent = true } },

	-- Close Quickfix Window
	{ "<leader>cc", "<cmd>cclose<cr>", description = "Close quickfix window", opts = { silent = true } },
}

local M = {
	{
		"mrjones2014/legendary.nvim",
		priority = 10000,
		lazy = false,
		dependencies = { "kkharji/sqlite.lua" },
		keys = { { map.CMD_SHIFT_T, "<cmd>Legendary<cr>", desc = "Open Command Palette" } },
		config = function()
			require("legendary").setup({
				keymaps = keymaps,
				extensions = {
					lazy_nvim = true,
				},
			})
		end,
	},
}

return M
