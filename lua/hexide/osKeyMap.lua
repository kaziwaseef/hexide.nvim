local M = {}

local mac_map = {
	CMD_c = "<C-c>",
	CMD_a = "<C-a>",
	CMD_u = "<C-u>",
	CMD_j = "<C-j>",
	CMD_k = "<C-k>",
	CMD_l = "<C-l>",
	CMD_h = "<C-h>",
	CMD_SHIFT_V = "√",
	CMD_SHIFT_S = "ß",
	CMD_i = "<C-i>",
	CMD_comma = "≤",
	CMD_period = "≥",
	CMD_SHIFT_comma = "¯",
	CMD_SHIFT_period = "˘",
	CMD_1 = "¡",
	CMD_2 = "™",
	CMD_3 = "£",
	CMD_4 = "¢",
	CMD_5 = "∞",
	CMD_6 = "§",
	CMD_7 = "¶",
	CMD_8 = "•",
	CMD_9 = "ª",
	OPT_p = "π",
	OPT_w = "∑",
	OPT_j = "∆",
	OPT_k = "˚",
	OPT_h = "˙",
	OPT_l = "¬",
	CMD_p = "<C-p>",
	CMD_SHIFT_P = "++",
	CMD_f = "+-",
	CMD_SHIFT_T = "†",
	CMD_t = "<C-t>",
}

local regular_map = {
	CMD_c = "<C-c>",
	CMD_a = "<C-a>",
	CMD_u = "<C-u>",
	CMD_j = "<C-j>",
	CMD_k = "<C-k>",
	CMD_l = "<C-l>",
	CMD_h = "<C-h>",
	CMD_SHIFT_V = "√",
	CMD_SHIFT_S = "ß",
	CMD_i = "<C-i>",
	CMD_comma = "≤",
	CMD_period = "≥",
	CMD_SHIFT_comma = "¯",
	CMD_SHIFT_period = "˘",
	CMD_1 = "¡",
	CMD_2 = "™",
	CMD_3 = "£",
	CMD_4 = "¢",
	CMD_5 = "∞",
	CMD_6 = "§",
	CMD_7 = "¶",
	CMD_8 = "•",
	CMD_9 = "ª",
	OPT_p = "<A-p>",
	OPT_w = "<A-w>",
	OPT_j = "∆",
	OPT_k = "˚",
	OPT_h = "˙",
	OPT_l = "¬",
	CMD_p = "<C-p>",
	CMD_SHIFT_P = "++",
	CMD_f = "+-",
	CMD_SHIFT_T = "†",
	CMD_t = "<C-t>",
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
