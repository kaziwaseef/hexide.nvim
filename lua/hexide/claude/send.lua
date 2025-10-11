local M = {}

local ensure_claude_pane = require("hexide.claude.findPane").ensure_claude_pane

M.send_to_claude = function(text)
	local target = ensure_claude_pane()
	if not target then
		vim.notify("Cannot send to Claude: no pane found", vim.log.levels.ERROR)
		return false
	end

	-- Escape single quotes in the text for tmux
	local escaped = text:gsub("'", "'\\''")
	local cmd = string.format("tmux send-keys -t '%s' -l '%s' ", target, escaped)
	vim.fn.system(cmd)

	if vim.v.shell_error ~= 0 then
		vim.notify("Failed to send to Claude pane", vim.log.levels.ERROR)
		return false
	end

	return true
end

return M
