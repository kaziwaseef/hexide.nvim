local opts = { noremap = true, silent = false }

local keymap = vim.api.nvim_set_keymap

function CallLazyGit()
	vim.g.lazygit_use_custom_config_file_path = 1
	vim.g.lazygit_config_file_path = "~/.config/nvim/lazygit.config.yaml"
	require("lazygit").lazygit()
end

keymap("n", "<leader>lg", ":lua CallLazyGit()<CR>", opts)
