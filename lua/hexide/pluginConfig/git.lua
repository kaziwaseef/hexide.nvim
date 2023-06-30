local M = {
    {
        "kdheepak/lazygit.nvim",
        keys = {
            {
                "<leader>lg",
                function ()
                    vim.g.lazygit_use_custom_config_file_path = 1
                    vim.g.lazygit_config_file_path = "~/.config/nvim/lazygit.config.yaml"
                    require("lazygit").lazygit()
                end,
                desc = "Open LazyGit"
            }
        }
    },
    {
        "tanvirtin/vgit.nvim",
        keys = {
            {
                "<leader>gh", "<cmd>VGit buffer_history_preview<cr>", desc = "Buffer Git Blame History"
            }
        }
    },
    "tpope/vim-fugitive",
}

return M
