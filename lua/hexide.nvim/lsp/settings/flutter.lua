local opts = { noremap = true, silent = true }

local keymap = vim.api.nvim_set_keymap

keymap("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", opts)
keymap("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", opts)
keymap("n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", opts)
keymap("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts)
keymap("n", "<C-k>", "<cmd>lua vim.lsp.buf.signature_help()<CR>", opts)
keymap("n", "<leader>rn", "<cmd>lua vim.lsp.buf.rename()<CR>", opts)
-- keymap("n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", opts)
keymap("n", "<leader>ca", "<cmd>lua vim.lsp.buf.code_action()<CR>", opts)
keymap("n", "[d", '<cmd>lua vim.diagnostic.goto_prev({ border = "rounded" })<CR>', opts)
keymap("n", "gl", '<cmd>lua vim.diagnostic.open_float({ border = "rounded" })<CR>', opts)
keymap("n", "]d", '<cmd>lua vim.diagnostic.goto_next({ border = "rounded" })<CR>', opts)

keymap("n", "<leader>fo", ":FlutterOutlineToggle<CR>", opts)
keymap("n", "<leader>fd", ":FlutterDevices<CR>", opts)
keymap("n", "<leader>fe", ":FlutterEmulators<CR>", opts)
keymap("n", "<leader>ft", ":FlutterOpenDevTools<CR>", opts)
keymap("n", "<leader>fr", ":FlutterReload<CR>", opts)
keymap("n", "<leader>fR", ":FlutterRestart<CR>", opts)
