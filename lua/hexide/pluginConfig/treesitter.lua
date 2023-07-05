local M = {
	{
		"nvim-treesitter/nvim-treesitter",
		config = function()
			local configs = require("nvim-treesitter.configs")
			configs.setup({
				ensure_installed = {
					"c",
					"lua",
					"vim",
					"vimdoc",
					"query",
					-- ^ Required
					"typescript",
					"javascript",
					"tsx",
					"go",
					"gomod",
					"gosum",
					"gowork",
					"ruby",
					"dart",
					"bash",
					"dockerfile",
					"graphql",
					"html",
					"css",
					"scss",
					"prisma",
					"json",
					"yaml",
					"git_config",
					"git_rebase",
					"gitattributes",
					"gitcommit",
					"gitignore",
					"make",
					"markdown",
					"sql",
					"svelte",
					"vue",
				},
				sync_install = false,
				highlight = {
					enable = true, -- false will disable the whole extension
					disable = { "" }, -- list of language that will be disabled
					additional_vim_regex_highlighting = false,
				},
				indent = {
					enable = false,
					disable = { "yaml" },
				},
				rainbow = {
					enable = false,
					-- disable = { "jsx", "cpp" }, list of languages you want to disable the plugin for
					-- extended_mode = true, -- Also highlight non-bracket delimiters like html tags, boolean or table: lang -> boolean
					-- max_file_lines = 10000, -- Do not enable for files with more than n lines, int
					-- colors = {}, -- table of hex strings
					-- termcolors = {} -- table of colour name strings
				},
			})
		end,
	},
}

return M
