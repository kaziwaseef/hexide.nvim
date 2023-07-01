local map = require("hexide.osKeyMap").mapping

local M = {
	{
		"mrjones2014/legendary.nvim",
		priority = 10000,
		lazy = false,
		dependencies = { "kkharji/sqlite.lua" },
		keys = { { map.CMD_SHIFT_T, "<cmd>Legendary<cr>", desc = "Open Command Palette" } },
		config = function()
			require("legendary").setup({
				lazy_nvim = { auto_register = true },
			})
		end,
	},
}

return M
