local M = {}

local send_to_claude = require("hexide.claude.send").send_to_claude

M.send_file_claude = function(filepath_override)
	local filepath = type(filepath_override) == "string" and filepath_override or vim.api.nvim_buf_get_name(0)
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

	-- Format as @relative/path with a space after
	local message = string.format("@%s ", relative_path)

	local success = send_to_claude(message)

	if not success then
		vim.notify("Error: Could not send file to claude")
	end
end

return M
