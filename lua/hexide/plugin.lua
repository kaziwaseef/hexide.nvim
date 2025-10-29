require("hexide.pluginConfig.lazyPackageManager")

local tableUtils = require("hexide.utils.table")
local completionPlugins = require("hexide.pluginConfig.completion")
local telescopePlugins = require("hexide.pluginConfig.telescope")
local treesitterPlugins = require("hexide.pluginConfig.treesitter")
local gitPlugins = require("hexide.pluginConfig.git")
local neoTreePlugins = require("hexide.pluginConfig.neoTree")
local lspConfigPlugins = require("hexide.pluginConfig.lspConfig")
local legendaryPlugins = require("hexide.pluginConfig.legendaryPlugins")
local motionPlugins = require("hexide.pluginConfig.motion")
local searchPlugins = require("hexide.pluginConfig.search")

local map = require("hexide.osKeyMap").mapping

local commonPlugins = {
	"nvim-lua/popup.nvim",
	"nvim-lua/plenary.nvim",
	"vim-scripts/ReplaceWithRegister",
	"tpope/vim-commentary",
	{
		"axkirillov/hbac.nvim",
		config = function()
			require("hbac").setup({
				autoclose = true,
				threshold = 5,
			})
		end,
	},
	{
		"JoosepAlviste/nvim-ts-context-commentstring",
		config = function()
			require("nvim-treesitter.configs").setup({})
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
		"cbochs/grapple.nvim",
		dependencies = {
			{ "nvim-tree/nvim-web-devicons", lazy = true },
		},
		opts = {
			scope = "git",
		},
		event = { "BufReadPost", "BufNewFile" },
		cmd = "Grapple",
		keys = {
			{
				"<leader>ma",
				function()
					require("grapple").toggle()
					require("neo-tree.sources.manager").refresh("filesystem")
				end,
				desc = "Grapple toggle tag",
			},
			{ "<leader>M", "<cmd>Grapple toggle_tags<cr>", desc = "Grapple open tags window" },
			{ map.CMD_period, "<cmd>Grapple cycle_tags next<cr>", desc = "Grapple cycle next tag" },
			{ map.CMD_comma, "<cmd>Grapple cycle_tags prev<cr>", desc = "Grapple cycle previous tag" },
			{ map.CMD_1, "<cmd>Grapple select index=1<cr>", desc = "Select first tag" },
			{ map.CMD_2, "<cmd>Grapple select index=2<cr>", desc = "Select second tag" },
			{ map.CMD_3, "<cmd>Grapple select index=3<cr>", desc = "Select third tag" },
			{ map.CMD_4, "<cmd>Grapple select index=4<cr>", desc = "Select fourth tag" },
			{ map.CMD_5, "<cmd>Grapple select index=5<cr>", desc = "Select fifth tag" },
			{ map.CMD_6, "<cmd>Grapple select index=6<cr>", desc = "Select sixth tag" },
			{ map.CMD_7, "<cmd>Grapple select index=7<cr>", desc = "Select seventh tag" },
			{ map.CMD_8, "<cmd>Grapple select index=8<cr>", desc = "Select eighth tag" },
			{ map.CMD_9, "<cmd>Grapple select index=9<cr>", desc = "Select ninth tag" },
		},
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
