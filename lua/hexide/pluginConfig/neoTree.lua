-- Alacritty Map
local map = require("hexide.osKeyMap").mapping

local M = {
	{
		"nvim-neo-tree/neo-tree.nvim",
		lazy = false,
		keys = {
			{
				map.CMD_t,
				"<cmd>Neotree source=filesystem reveal=true<cr>",
				desc = "Neo Tree File Browser",
			},
		},
		branch = "v3.x",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"MunifTanjim/nui.nvim",
			"nvim-tree/nvim-web-devicons",
			"folke/snacks.nvim",
			"antosha417/nvim-lsp-file-operations",
		},
		config = function()
			require("neo-tree").setup({
				close_if_last_window = true,
				window = {
					position = "left",
					width = 30,
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
					window = {
						mappings = {
							["o"] = "system_open",
							["y"] = "copy_relative_path",
							["Y"] = "copy_absolute_path",
						},
					},
					components = {},
					renderers = {
						file = {
							{ "icon" },
							{ "name", use_git_status_colors = true },
							{ "diagnostics" },
							{ "git_status", highlight = "NeoTreeDimText" },
						},
					},
				},
				commands = {
					system_open = function(state)
						local node = state.tree:get_node()
						local path = node:get_id()

						if vim.loop.os_uname().sysname == "Darwin" then
							vim.fn.jobstart({ "open", path }, { detach = true })
						else
							vim.fn.jobstart({ "xdg-open", path }, { detach = true })
						end
					end,
					copy_absolute_path = function(state)
						local node = state.tree:get_node()
						local path = node:get_id()
						vim.fn.setreg("+", path)
						vim.notify("Copied: " .. path)
					end,
					copy_relative_path = function(state)
						local node = state.tree:get_node()
						local rel_path = vim.fn.fnamemodify(node:get_id(), ":.")
						vim.fn.setreg("+", rel_path)
						vim.notify("Copied: " .. rel_path)
					end,
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
