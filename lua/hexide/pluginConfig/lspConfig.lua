local M = {
	"neovim/nvim-lspconfig",
	"akinsho/flutter-tools.nvim",
	{
		"j-hui/fidget.nvim",
		event = "BufEnter",
		config = function()
			require("fidget").setup()
		end,
		tag = "v2.0.0",
	},
	{
		"mhartington/formatter.nvim",
		event = "BufEnter",
		keys = {
			{
				"<leader>fm",
				"<cmd>Format<cr>",
				desc = "Format",
			},
			{
				-- Not <leader>w: CamelCaseMotion claims it
				"<leader>W",
				"<cmd>noautocmd w<cr>",
				desc = "Save without Formatting",
			},
		},
		config = function()
			require("formatter").setup({
				filetype = {
					lua = { require("formatter.filetypes.lua").stylua },
					go = { require("formatter.filetypes.go").goimports },
					dart = { require("formatter.filetypes.dart").dartformat },
					javascript = { require("formatter.defaults.prettier") },
					vue = { require("formatter.defaults.prettier") },
					javascriptreact = { require("formatter.defaults.prettier") },
					svelte = { require("formatter.defaults.prettier") },
					typescript = { require("formatter.defaults.prettier") },
					typescriptreact = { require("formatter.defaults.prettier") },
					graphql = { require("formatter.defaults.prettier") },
					python = { require("formatter.filetypes.python").autopep8 },
					astro = { require("formatter.defaults.prettier") },
					json = { require("formatter.defaults.prettier") },
					html = { require("formatter.defaults.prettier") },
					terraform = { require("formatter.filetypes.terraform") },
					rust = { require("formatter.filetypes.rust").rustfmt },
					["*"] = { require("formatter.filetypes.any").remove_trailing_whitespace },
				},
			})
			local autoFormatFiles = {
				"*.js",
				"*.jsx",
				"*.mjs",
				"*.ts",
				"*.tsx",
				"*.css",
				"*.less",
				"*.scss",
				"*.json",
				"*.graphql",
				"*.lua",
				"*.dart",
				"*.vue",
				"*.go",
				"*.py",
				"*.astro",
				"*.json",
				"*.html",
				"*.yaml",
				"*.tf",
				"*.rs",
			}
			require("hexide.autocommands").create_autoformat_autocmd(autoFormatFiles)
		end,
	},
	{
		"kosayoda/nvim-lightbulb",
		event = "BufEnter",
		config = function()
			require("nvim-lightbulb").setup({
				sign = {
					enabled = true,
					priority = 10000,
				},
				autocmd = {
					enabled = true,
				},
			})
		end,
	},
}

return M
