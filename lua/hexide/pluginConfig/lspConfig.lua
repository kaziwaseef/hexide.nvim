local M = {
	"williamboman/mason.nvim",
	"WhoIsSethDaniel/mason-tool-installer.nvim",
	"williamboman/mason-lspconfig.nvim",
	"neovim/nvim-lspconfig",
	"akinsho/flutter-tools.nvim",
	{
		"j-hui/fidget.nvim",
		event = "BufEnter",
		config = function()
			require("fidget").setup()
		end,
		tag = "legacy",
		dependencies = { "neovim/nvim-lspconfig" },
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
				"<leader>w",
				"<cmd>noautocmd w<cr>",
				desc = "Format",
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
				-- "*.prisma",
			}
			local afgroup = vim.api.nvim_create_augroup("AutoFormatting", {})
			vim.api.nvim_create_autocmd("BufWritePost", {
				pattern = table.concat(autoFormatFiles, ","),
				group = afgroup,
				callback = function()
					vim.cmd("FormatWrite")
				end,
			})
		end,
	},
	-- {
	-- 	"jose-elias-alvarez/null-ls.nvim",
	-- 	dependencies = { "davidmh/cspell.nvim" },
	-- 	config = function()
	-- 		local sources = {
	-- 			-- require("cspell").diagnostics.with({
	-- 			-- 	diagnostic_config = {
	-- 			-- 		-- see :help vim.diagnostic.config()
	-- 			-- 		underline = true,
	-- 			-- 		virtual_text = false,
	-- 			-- 		signs = false,
	-- 			-- 		update_in_insert = false,
	-- 			-- 		severity_sort = false,
	-- 			-- 	},
	-- 			-- }),
	-- 			-- require("cspell").code_actions,
	-- 			require("null-ls").builtins.formatting.stylua,
	-- 			require("null-ls").builtins.formatting.prettier,
	-- 			require("null-ls").builtins.formatting.goimports,
	-- 			require("null-ls").builtins.diagnostics.golangci_lint,
	-- 			require("null-ls").builtins.formatting.autopep8,
	-- 			require("null-ls").builtins.diagnostics.mypy,
	-- 		}
	-- 		require("null-ls").setup({
	-- 			debug = true,
	-- 			sources = sources,
	-- 		})
	-- 	end,
	-- },
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
