local M = {}

-- NOTE: commented-out entries are unclaimed (no consumer in the config).
-- alacritty.toml already sends their glyphs, so to claim one just uncomment
-- it here AND in the regular_map below, then map `map.CMD_x` at the call site.

local mac_map = {
	CMD_c = "<C-c>",
	CMD_a = "<C-a>",
	-- CMD_u = "<C-u>",
	CMD_j = "↓",
	CMD_k = "↑",
	-- CMD_l = "→",
	-- CMD_h = "←",
	CMD_SHIFT_J = "⇣",
	CMD_SHIFT_K = "⇡",
	CMD_SHIFT_L = "⇢",
	CMD_SHIFT_H = "⇠",
	CMD_SHIFT_V = "√",
	CMD_SHIFT_S = "ß",
	CMD_i = "ı",
	CMD_comma = "≤",
	CMD_period = "≥",
	-- CMD_SHIFT_comma = "¯",
	-- CMD_SHIFT_period = "˘",
	CMD_1 = "¡",
	CMD_2 = "™",
	CMD_3 = "£",
	CMD_4 = "¢",
	CMD_5 = "∞",
	CMD_6 = "§",
	CMD_7 = "¶",
	CMD_8 = "•",
	CMD_9 = "ª",
	-- OPT_p = "π",
	-- OPT_w = "∑",
	CMD_p = "<C-p>",
	CMD_SHIFT_P = "++",
	CMD_f = "+-",
	CMD_SHIFT_T = "†",
	CMD_t = "<C-t>",
	CMD_g = "µ",
}

local regular_map = {
	CMD_c = "<C-c>",
	CMD_a = "<C-a>",
	-- CMD_u = "<C-u>",
	CMD_j = "<C-j>",
	CMD_k = "<C-k>",
	-- CMD_l = "<C-l>",
	-- CMD_h = "<C-h>",
	CMD_SHIFT_J = "<C-S-J>",
	CMD_SHIFT_K = "<C-S-K>",
	CMD_SHIFT_L = "<C-S-L>",
	CMD_SHIFT_H = "<C-S-H>",
	CMD_SHIFT_V = "√",
	CMD_SHIFT_S = "ß",
	CMD_i = "ı",
	CMD_comma = "≤",
	CMD_period = "≥",
	-- CMD_SHIFT_comma = "¯",
	-- CMD_SHIFT_period = "˘",
	CMD_1 = "¡",
	CMD_2 = "™",
	CMD_3 = "£",
	CMD_4 = "¢",
	CMD_5 = "∞",
	CMD_6 = "§",
	CMD_7 = "¶",
	CMD_8 = "•",
	CMD_9 = "ª",
	-- OPT_p = "<A-p>",
	-- OPT_w = "<A-w>",
	CMD_p = "<C-p>",
	CMD_SHIFT_P = "++",
	CMD_f = "+-",
	CMD_SHIFT_T = "†",
	CMD_t = "<C-t>",
	CMD_g = "µ",
}

-- override = 'mac' or 'regular'
function M.setup(override)
	if override == "mac" then
		M.mapping = mac_map
	elseif override == "regular" then
		M.mapping = regular_map
	elseif vim.loop.os_uname().sysname == "Darwin" then
		M.mapping = mac_map
	else
		M.mapping = regular_map
	end
end

return M
