-- Alacritty Map
local map = require("hexide.osKeyMap").mapping

local M = {
	{
		"nvim-neo-tree/neo-tree.nvim",
		lazy = false,
		keys = {
			{
				map.CMD_t,
				"<cmd>Neotree source=filesystem reveal=true position=right<cr>",
				desc = "Neo Tree File Browser",
			},
		},
		branch = "v2.x",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"MunifTanjim/nui.nvim",
		},
		config = function()
			require("neo-tree").setup({
				close_if_last_window = true,
				window = {
					position = "right",
				},
				filesystem = {
					use_libuv_file_watcher = true,
					filtered_items = {
						hide_dotfiles = false,
						hide_gitignored = false,
						hide_by_name = {
							".git",
							".DS_Store",
							"thumbs.db",
						},
					},
				},
				default_component_configs = {
					git_status = {
						symbols = {
							-- Change type
							added = "", -- NOTE: you can set any of these to an empty string to not show them
							deleted = "✖",
							modified = "✹",
							renamed = "",
							-- Status type
							untracked = "✭",
							ignored = "",
							-- unstaged = "",
							unstaged = "",
							staged = "✔︎",
							conflict = "",
						},
						align = "right",
					},
				},
			})
		end,
	},
}

return M
