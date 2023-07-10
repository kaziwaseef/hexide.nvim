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
		"jose-elias-alvarez/null-ls.nvim",
		dependencies = { "davidmh/cspell.nvim" },
		config = function()
			require("null-ls").setup({
				sources = {
					require("cspell").diagnostics.with({
						diagnostic_config = {
							-- see :help vim.diagnostic.config()
							underline = true,
							virtual_text = false,
							signs = false,
							update_in_insert = false,
							severity_sort = false,
						},
					}),
					require("cspell").code_actions,
					require("null-ls").builtins.formatting.stylua,
					require("null-ls").builtins.formatting.prettier,
					require("null-ls").builtins.formatting.goimports,
					require("null-ls").builtins.diagnostics.golangci_lint,
					require("null-ls").builtins.formatting.autopep8,
					require("null-ls").builtins.diagnostics.mypy,
				},
			})
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
