local M = {}

M.setup = function(opts)
	if opts.global then
		vim.g.claude_tmux_global = opts.global
	end
end

M.find = require("hexide.claude.findPane").find_claude_pane
M.send = require("hexide.claude.sendCode").send_code_claude
M.send_file = require("hexide.claude.sendFile").send_file_claude

-- Claude find pane
vim.api.nvim_create_user_command("ClaudeFind", M.find, {
	desc = "Find tmux pane running Claude (by following child processes)",
})

-- Claude send code
vim.api.nvim_create_user_command("ClaudeSend", M.send, {
	desc = "Send Highlighted code",
	range = true,
})

-- Claude send file
vim.api.nvim_create_user_command("ClaudeSendFile", M.send_file, {
	desc = "Send the file",
})

local opts = { noremap = true, silent = true }
local keymap = vim.api.nvim_set_keymap

keymap("n", "<leader>af", "<cmd>ClaudeSendFile<cr>", opts)
keymap("n", "<leader>as", "<cmd>ClaudeSend<cr>", opts)
keymap("v", "<leader>as", ":'<,'>ClaudeSend<cr>", opts)

return M
