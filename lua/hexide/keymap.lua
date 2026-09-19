-- Leader must be set before plugins (incl. legendary) create their keymaps
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Prevent space from moving the cursor when leader is pressed
vim.keymap.set({ "n", "v", "o" }, "<Space>", "<Nop>", { silent = true, desc = "Leader" })

-- No-op remap so terminal Tab input has a defined insert-mode target
vim.keymap.set("i", "<Tab>", "<Tab>", { noremap = true, silent = true, desc = "Insert tab" })
