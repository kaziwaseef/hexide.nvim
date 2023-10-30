require("hexide.pluginConfig.lazyPackageManager")

local tableUtils = require("hexide.utils.table")
local completionPlugins = require("hexide.pluginConfig.completion")
local telescopePlugins = require("hexide.pluginConfig.telescope")
local treesitterPlugins = require("hexide.pluginConfig.treesitter")
local gitPlugins = require("hexide.pluginConfig.git")
local tabPlugins = require("hexide.pluginConfig.barbar")
local neoTreePlugins = require("hexide.pluginConfig.neoTree")
local lspConfigPlugins = require("hexide.pluginConfig.lspConfig")
local legendaryPlugins = require("hexide.pluginConfig.legendaryPlugins")
local motionPlugins = require("hexide.pluginConfig.motion")
local searchPlugins = require("hexide.pluginConfig.search")

local commonPlugins = {
	"nvim-lua/popup.nvim",
	"nvim-lua/plenary.nvim",
	"vim-scripts/ReplaceWithRegister",
	"tpope/vim-commentary",
	{
		"JoosepAlviste/nvim-ts-context-commentstring",
		config = function()
			require("nvim-treesitter.configs").setup({
				context_commentstring = {
					enable = true,
				},
			})
		end,
	},
	{
		"iamcco/markdown-preview.nvim",
		keys = {
			{ "<leader>md", "<cmd>MarkdownPreview<cr>", desc = "Markdown Preview" },
		},
		build = function()
			vim.fn["mkdp#util#install"]()
		end,
	},
	{
		"petertriho/nvim-scrollbar",
		lazy = false,
		config = function()
			require("scrollbar").setup()
		end,
	},
	{
		"zbirenbaum/copilot.lua",
		cmd = "Copilot",
		event = "InsertEnter",
		config = function()
			require("copilot").setup({
				suggestion = { enabled = false },
				panel = { enabled = false },
			})
		end,
	},
	{
		"zbirenbaum/copilot-cmp",
		after = { "copilot.lua" },
		config = function()
			require("copilot_cmp").setup()
		end,
	},
}

local colorSchemes = {
	{
		"navarasu/onedark.nvim",
		lazy = false, -- make sure we load this during startup if it is your main colorscheme
		priority = 1000, -- make sure to load this before all the other start plugins
		config = function()
			require("onedark").setup({
				style = "warm",
			})
			require("onedark").load()
		end,
	},
}

local airLinePlugins = {
	{
		"vim-airline/vim-airline",
		dependencies = {
			"kyazdani42/nvim-web-devicons",
		},
	},
}

local internalPlugins = tableUtils.spreadTables(
	commonPlugins,
	legendaryPlugins,
	colorSchemes,
	tabPlugins,
	treesitterPlugins,
	lspConfigPlugins,
	airLinePlugins,
	telescopePlugins,
	completionPlugins,
	neoTreePlugins,
	gitPlugins,
	motionPlugins,
	searchPlugins
)

local plugins = internalPlugins

local hasCustomOpts, userCustomOpts = pcall(require, "hexide.userConfig")

if hasCustomOpts then
	plugins = tableUtils.spreadTables(plugins, userCustomOpts.plugins)
end

local opts = {}

require("lazy").setup(plugins, opts)
