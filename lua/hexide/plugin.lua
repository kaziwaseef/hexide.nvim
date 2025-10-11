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

local commonPlugins = {
	"nvim-lua/popup.nvim",
	"nvim-lua/plenary.nvim",
	"vim-scripts/ReplaceWithRegister",
	"tpope/vim-commentary",
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
		"ThePrimeagen/harpoon",
		branch = "harpoon2",
		dependencies = { "nvim-lua/plenary.nvim" },
		config = function()
			local harpoon = require("harpoon")

			harpoon:setup()

			local map = require("hexide.osKeyMap").mapping

			vim.keymap.set("n", "<leader>a", function()
				harpoon:list():add()
			end)
			vim.keymap.set("n", "<leader>au", function()
				harpoon.ui:toggle_quick_menu(harpoon:list())
			end)

			vim.keymap.set("n", map.CMD_1, function()
				harpoon:list():select(1)
			end)
			vim.keymap.set("n", map.CMD_2, function()
				harpoon:list():select(2)
			end)
			vim.keymap.set("n", map.CMD_3, function()
				harpoon:list():select(3)
			end)
			vim.keymap.set("n", map.CMD_4, function()
				harpoon:list():select(4)
			end)

			-- Toggle previous & next buffers stored within Harpoon list
			vim.keymap.set("n", map.CMD_comma, function()
				harpoon:list():prev()
			end)
			vim.keymap.set("n", map.CMD_period, function()
				harpoon:list():next()
			end)
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
	-- tabPlugins,
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
