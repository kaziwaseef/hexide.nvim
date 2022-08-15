require("nvim-tree").setup({
    sort_by = "case_sensitive",
    prefer_startup_root = true,
    sync_root_with_cwd = true,
    reload_on_bufenter = true,
    disable_netrw = true,
    open_on_setup = true,
    view = {
        side = "right",
        adaptive_size = true,
        mappings = {
            list = {
                { key = "u", action = "dir_up" },
            },
        },
    },
    renderer = {
        group_empty = true,
    },
    filters = {
        dotfiles = false,
    },
    actions = {
        change_dir = {
            enable = true,
            restrict_above_cwd = true,
        },
    },
    git = {
        ignore = false,
    },
})
local opts = { noremap = true, silent = true }
local keymap = vim.api.nvim_set_keymap

-- Alacritty Map
local map = {
  CMD_SHIFT_T = "†",
  CMD_t = "<C-t>",
}

keymap("n", map.CMD_SHIFT_T, ':NvimTreeToggle<CR>', opts)
keymap("n", map.CMD_t, ':NvimTreeFindFile<CR>', opts)

