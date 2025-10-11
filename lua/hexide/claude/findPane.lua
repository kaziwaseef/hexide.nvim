local M = {}

local function leaf_cmd_for_pid(pid)
	-- Walk down the child chain using pgrep -P until there are no children.
	-- Returns the leaf PID and its full command line.
	local leaf = pid
	while true do
		local kids = vim.fn.systemlist(("pgrep -P %s"):format(leaf))
		if vim.v.shell_error ~= 0 or not kids or #kids == 0 then
			break
		end
		-- Heuristic: pick the last child (often the most recent/foreground)
		leaf = kids[#kids]
	end
	local cmd = vim.fn.systemlist(("ps -o command= -p %s"):format(leaf))[1] or ""
	return leaf, cmd
end

M.find_claude_pane = function()
	if vim.fn.executable("tmux") == 0 then
		vim.notify("ClaudeFind: tmux not found", vim.log.levels.ERROR)
		return
	end
	-- Grab: target + pane_pid (+ a few extras if you want)
	local fmt = "'#{session_name}:#{window_index}.#{pane_index} #{pane_pid} #{pane_title}'"
	local lines = vim.fn.systemlist("tmux list-panes -F " .. fmt)
	if vim.v.shell_error ~= 0 or #lines == 0 then
		vim.notify("ClaudeFind: no tmux panes found", vim.log.levels.WARN)
		return
	end

	local matches = {}
	for _, line in ipairs(lines) do
		-- target pid title...
		local target, pid = line:match("^(%S+)%s+(%d+)")
		if target and pid then
			local leaf_pid, full = leaf_cmd_for_pid(pid)
			local low = (full or ""):lower()
			if low:find("claude", 1, true) or low:find("anthropic", 1, true) or low:find("claude%-code") then
				table.insert(matches, { target = target, leaf_pid = leaf_pid, full = full })
			end
		end
	end

	if #matches == 0 then
		vim.notify("ClaudeFind: no Claude process found (tried child processes of zsh)", vim.log.levels.WARN)
		return
	end

	local pick = matches[1] -- or show a picker if you may have several
	vim.g.claude_tmux_target = pick.target
	vim.notify(("Claude pane: %s\n%s"):format(pick.target, pick.full), vim.log.levels.INFO)
	return pick.target
end

M.ensure_claude_pane = function()
	-- Check if we have a target set
	if not vim.g.claude_tmux_target then
		vim.notify("No Claude pane set. Searching...", vim.log.levels.INFO)
		return M.find_claude_pane()
	end

	-- Verify the pane still exists
	local check_cmd = string.format("tmux list-panes -F '#{session_name}:#{window_index}.#{pane_index}' 2>/dev/null")
	local panes = vim.fn.systemlist(check_cmd)
	local pane_exists = false
	for _, pane in ipairs(panes) do
		if pane == vim.g.claude_tmux_target then
			pane_exists = true
			break
		end
	end

	if not pane_exists then
		vim.notify("Claude pane no longer exists. Searching again...", vim.log.levels.WARN)
		vim.g.claude_tmux_target = nil
		return M.find_claude_pane()
	end

	return vim.g.claude_tmux_target
end

return M
