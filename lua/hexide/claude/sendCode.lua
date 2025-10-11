local M = {}

local send_to_claude = require("hexide.claude.send").send_to_claude

M.send_code_claude = function(opts)
	-- Check if line range exists
	if not opts.line1 or not opts.line2 then
		vim.notify("No line range selected", vim.log.levels.WARN)
		return
	end

	-- Get the current file path
	local filepath = vim.api.nvim_buf_get_name(0)
	if filepath == "" then
		vim.notify("No file in current buffer", vim.log.levels.WARN)
		return
	end

	-- Get the current working directory
	local cwd = vim.fn.getcwd()

	-- Convert to relative path if possible
	local relative_path = filepath
	if filepath:sub(1, #cwd) == cwd then
		relative_path = filepath:sub(#cwd + 2) -- +2 to skip the trailing slash
	end

	-- Format as @relative/path#L{line1}-{line2} or @relative/path#L{line1} if same line
	local message
	if opts.line1 == opts.line2 then
		message = string.format("@%s#L%d ", relative_path, opts.line1)
	else
		message = string.format("@%s#L%d-%d ", relative_path, opts.line1, opts.line2)
	end

	send_to_claude(message)
end

return M
