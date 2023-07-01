vim.cmd([[
    fun! SetupCommandAlias(from, to)
        exec 'cnoreabbrev <expr> '.a:from
            \ .' ((getcmdtype() is# ":" && getcmdline() is# "'.a:from.'")'
            \ .'? ("'.a:to.'") : ("'.a:from.'"))'
    endfun
    call SetupCommandAlias("git","Git")
]])

local M = {
	{
		"kdheepak/lazygit.nvim",
		keys = {
			{
				"<leader>lg",
				function()
					vim.g.lazygit_use_custom_config_file_path = 1
					vim.g.lazygit_config_file_path = "~/.config/nvim/lazygit.config.yaml"
					require("lazygit").lazygit()
				end,
				desc = "Open LazyGit",
			},
		},
	},
	{
		"tanvirtin/vgit.nvim",
		event = "BufEnter",
		keys = {
			{
				"<leader>gh",
				"<cmd>VGit buffer_history_preview<cr>",
				desc = "Buffer Git Blame History",
			},
		},
		config = function()
			require("vgit").setup()
		end,
	},
	"tpope/vim-fugitive",
}

return M
