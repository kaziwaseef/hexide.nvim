local cmd = vim.api.nvim_command

cmd('autocmd BufWritePre *.tsx,*.ts,*.jsx,*.js EslintFixAll')

return {}
