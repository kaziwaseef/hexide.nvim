local M = {
	{
		"nvim-treesitter/nvim-treesitter",
		branch = "main",
		lazy = false,
		build = ":TSUpdate",
		config = function()
			require("nvim-treesitter").setup({})

			local languages = {
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
				"astro",
				"terraform",
			}

			require("nvim-treesitter").install(languages)

			local filetypes = {
				"c", "lua", "vim", "vimdoc", "query",
				"typescript", "javascript", "typescriptreact", "javascriptreact",
				"go", "gomod", "gosum", "gowork",
				"ruby", "dart", "sh", "dockerfile", "graphql",
				"html", "css", "scss", "prisma",
				"json", "yaml",
				"git_config", "git_rebase", "gitattributes", "gitcommit", "gitignore",
				"make", "markdown", "sql",
				"svelte", "vue", "astro", "terraform",
			}

			vim.api.nvim_create_autocmd("FileType", {
				pattern = filetypes,
				callback = function(args)
					pcall(vim.treesitter.start, args.buf)

					-- Treesitter-based indentation (experimental), disabled for yaml
					if args.match ~= "yaml" then
						vim.bo[args.buf].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
					end
				end,
			})
		end,
	},
}

return M
