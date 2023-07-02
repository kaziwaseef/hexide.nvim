-- Alacritty Map
local map = require("hexide.osKeyMap").mapping

local M = {
	{
		"nvim-pack/nvim-spectre",
		config = function()
			require("spectre").setup()
		end,
		keys = {
			{ map.CMD_f, '<cmd>lua require("spectre").toggle()<CR>', desc = "Open Global Search" },
			-- { "<leader>sw", '<cmd>lua require("spectre").open_visual({select_word=true})<CR>' },
			-- { "<leader>sp", '<cmd>lua require("spectre").open_file_search({select_word=true})<CR>' },
			-- { "<leader>sw", '<esc><cmd>lua require("spectre").open_visual()<CR>', mode = "v" },
		},
	},
}

return M
