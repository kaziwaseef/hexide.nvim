local cmd = vim.api.nvim_command

cmd("autocmd BufWritePre *.tsx,*.ts,*.jsx,*.js EslintFixAll")

local keymap = vim.api.nvim_set_keymap


return {}
