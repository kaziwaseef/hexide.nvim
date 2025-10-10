require("hexide.pluginConfig.lazyPackageManager")

local tableUtils = require("hexide.utils.table")
local completionPlugins = require("hexide.pluginConfig.completion")
local telescopePlugins = require("hexide.pluginConfig.telescope")
local treesitterPlugins = require("hexide.pluginConfig.treesitter")
local gitPlugins = require("hexide.pluginConfig.git")
-- local tabPlugins = require("hexide.pluginConfig.barbar")
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

local aiPlugins = {
	{
		"coder/claudecode.nvim",
		dependencies = { "folke/snacks.nvim" },
		config = true,
		keys = {
			{ "<leader>a", nil, desc = "AI/Claude Code" },
			{ "<leader>ac", "<cmd>ClaudeCode<cr>", desc = "Toggle Claude" },
			{ "<leader>af", "<cmd>ClaudeCodeFocus<cr>", desc = "Focus Claude" },
			{ "<leader>ar", "<cmd>ClaudeCode --resume<cr>", desc = "Resume Claude" },
			{ "<leader>aC", "<cmd>ClaudeCode --continue<cr>", desc = "Continue Claude" },
			{ "<leader>am", "<cmd>ClaudeCodeSelectModel<cr>", desc = "Select Claude model" },
			{ "<leader>ab", "<cmd>ClaudeCodeAdd %<cr>", desc = "Add current buffer" },
			{ "<leader>as", "<cmd>ClaudeCodeSend<cr>", mode = "v", desc = "Send to Claude" },
			{
				"<leader>as",
				"<cmd>ClaudeCodeTreeAdd<cr>",
				desc = "Add file",
				ft = { "NvimTree", "neo-tree", "oil", "minifiles", "netrw" },
			},
			-- Diff management
			{ "<leader>aa", "<cmd>ClaudeCodeDiffAccept<cr>", desc = "Accept diff" },
			{ "<leader>ad", "<cmd>ClaudeCodeDiffDeny<cr>", desc = "Deny diff" },
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
	searchPlugins,
	aiPlugins
)

local plugins = internalPlugins

local hasCustomOpts, userCustomOpts = pcall(require, "hexide.userConfig")

if hasCustomOpts then
	plugins = tableUtils.spreadTables(plugins, userCustomOpts.plugins)
end

local opts = {}

require("lazy").setup(plugins, opts)
