-- Alacritty Map
local map = require("hexide.osKeyMap").mapping

local M = {
    {
        "romgrk/barbar.nvim",
        lazy = false,
        keys = {
            { map.OPT_p, "<cmd>BufferPin<cr>", desc = "Buffer/Tab Pin" },
            { map.OPT_w, "<cmd>BufferClose<cr>", desc = "Buffer/Tab Close" },
            { map.CMD_comma, "<cmd>BufferPrevious<cr>", desc = "Buffer/Tab Left" },
            { map.CMD_period, "<cmd>BufferNext<cr>", desc = "Buffer/Tab Right" },

            { map.CMD_SHIFT_comma, "<cmd>BufferMovePrevious<cr>", desc = "Move Buffer/Tab Left" },
            { map.CMD_SHIFT_period, "<cmd>BufferMoveNext<cr>", desc = "Move Buffer/Tab Right" },

            { map.CMD_1, "<cmd>BufferGoto 1<cr>", desc = "Buffer/Tab 1" },
            { map.CMD_2, "<cmd>BufferGoto 2<cr>", desc = "Buffer/Tab 2" },
            { map.CMD_3, "<cmd>BufferGoto 3<cr>", desc = "Buffer/Tab 3" },
            { map.CMD_4, "<cmd>BufferGoto 4<cr>", desc = "Buffer/Tab 4" },
            { map.CMD_5, "<cmd>BufferGoto 5<cr>", desc = "Buffer/Tab 5" },
            { map.CMD_6, "<cmd>BufferGoto 6<cr>", desc = "Buffer/Tab 6" },
            { map.CMD_7, "<cmd>BufferGoto 7<cr>", desc = "Buffer/Tab 7" },
            { map.CMD_8, "<cmd>BufferGoto 8<cr>", desc = "Buffer/Tab 8" },
            { map.CMD_9, "<cmd>BufferLast<cr>", desc = "Buffer/Tab Last" },
        }
    }
}

return M
