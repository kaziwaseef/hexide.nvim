local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
	PACKER_BOOTSTRAP = fn.system({
		"git",
		"clone",
		"--depth",
		"1",
		"https://github.com/wbthomason/packer.nvim",
		install_path,
	})
	print("Installing packer close and reopen Neovim...")
	vim.cmd([[packadd packer.nvim]])
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugin.lua source <afile> | PackerSync
  augroup end
]])

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
	return
end

-- Have packer use a popup window
packer.init({
	display = {
		open_fn = function()
			return require("packer.util").float({ border = "rounded" })
		end,
	},
})

-- Install your plugins here
return packer.startup({
	function(use)
		-- My plugins here
		use("wbthomason/packer.nvim") -- Have packer manage itself
		use("nvim-lua/popup.nvim") -- An implementation of the Popup API from vim in Neovim
		use("nvim-lua/plenary.nvim") -- Useful lua functions used by lots of plugins

		use({
			"kkharji/sqlite.lua",
			"mrjones2014/legendary.nvim",
		})

		-- Color Schemes
		use({
			"joshdick/onedark.vim",
		})
		use({
			"vim-airline/vim-airline",
			"kyazdani42/nvim-web-devicons",
		})
		use({
			"romgrk/barbar.nvim",
		})
		-- cmp plugins
		use({
			"hrsh7th/nvim-cmp", -- The completion plugin
			"hrsh7th/cmp-buffer", -- buffer completions
			"hrsh7th/cmp-path", -- path completions
			"hrsh7th/cmp-cmdline", -- cmdline completions
			"saadparwaiz1/cmp_luasnip", -- snippet completions
			"hrsh7th/cmp-nvim-lsp",
			"hrsh7th/cmp-nvim-lua",
		})

		-- snippets
		use({
			"L3MON4D3/LuaSnip", --snippet engine
			"rafamadriz/friendly-snippets", -- a bunch of snippets to use
		})
		-- Telescope
		use({
			"nvim-telescope/telescope.nvim",
			"nvim-telescope/telescope-ui-select.nvim",
		})

		-- File Tree
		use({
			"preservim/nerdtree",
			"Xuyuanp/nerdtree-git-plugin",
			"ryanoasis/vim-devicons",
		})
		-- Treesitter
		use({
			"nvim-treesitter/nvim-treesitter",
			run = ":TSUpdate",
		})
		use("p00f/nvim-ts-rainbow")

		-- LSP
		use({
			"williamboman/mason.nvim",
			"WhoIsSethDaniel/mason-tool-installer.nvim",
			"williamboman/mason-lspconfig.nvim",
			"neovim/nvim-lspconfig",
			"jose-elias-alvarez/null-ls.nvim",
		})
		use({
			"akinsho/flutter-tools.nvim",
		})
		use({
			"mfussenegger/nvim-dap",
		})
		use({
			"j-hui/fidget.nvim",
		})

		-- Git
		use({
			"tpope/vim-fugitive",
			"kdheepak/lazygit.nvim",
			"tanvirtin/vgit.nvim",
		})

		-- Comment
		use({
			"tpope/vim-commentary",
		})

		use({
			"JoosepAlviste/nvim-ts-context-commentstring",
			config = function()
				require("nvim-treesitter.configs").setup({
					context_commentstring = {
						enable = true,
					},
				})
			end,
		})

		-- Yank
		use({
			"vim-scripts/ReplaceWithRegister",
		})

		-- Motions
		use({
			"bkad/CamelCaseMotion",
		})

		use({
			"iamcco/markdown-preview.nvim",
			run = function()
				vim.fn["mkdp#util#install"]()
			end,
		})

		-- Find and Replace
		use({ "nvim-pack/nvim-spectre" })

		-- Automatically set up your configuration after cloning packer.nvim
		-- Put this at the end after all plugins
		if PACKER_BOOTSTRAP then
			require("packer").sync()
		end
	end,
	config = {
		clone_timeout = false,
	},
})
