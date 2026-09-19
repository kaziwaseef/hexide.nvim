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
			{
				map.CMD_g,
				function()
					local win
					for _, w in ipairs(vim.api.nvim_tabpage_list_wins(0)) do
						local b = vim.api.nvim_win_get_buf(w)
						if vim.bo[b].filetype == "neo-tree" then
							win = w
							break
						end
					end

					if not win then
						vim.cmd("Neotree focus source=git_status reveal=true")
						return
					end

					local showing_git = vim.fn.bufname(vim.api.nvim_win_get_buf(win)):find("git_status") ~= nil
					local focused = vim.api.nvim_get_current_win() == win

					if showing_git and focused then
						vim.cmd("Neotree toggle source=git_status")
					else
						vim.cmd("Neotree focus source=git_status")
					end
				end,
				desc = "Neo Tree Git Status",
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
					position = "right",
					width = 35,
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
							["g"] = "grapple_toggle",
						},
					},
					components = {
						grapple_index = function(config, node, _)
							local grapple = require("grapple")
							local path = node:get_id()
							local tags = grapple.tags()
							for index, value in ipairs(tags) do
								if value.path == path then
									return {
										text = string.format("⥤ %d", index),
										highlight = config.highlight or "NeoTreeDirectoryIcon",
									}
								end
							end

							return {}
						end,
					},
					renderers = {
						file = {
							{ "icon" },
							{ "name", use_git_status_colors = true },
							{ "grapple_index" },
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
					grapple_toggle = function(state)
						local node = state.tree:get_node()
						local path = node:get_id()
						require("grapple").toggle({
							path = path,
						})
						require("neo-tree.sources.manager").refresh("filesystem")
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
