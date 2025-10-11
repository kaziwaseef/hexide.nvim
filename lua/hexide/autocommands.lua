local M = {}

M.create_autoformat_autocmd = function(autoFormatFiles)
	local afgroup = vim.api.nvim_create_augroup("AutoFormatting", {})
	vim.api.nvim_create_autocmd("BufWritePost", {
		pattern = table.concat(autoFormatFiles, ","),
		group = afgroup,
		callback = function()
			vim.cmd("FormatWrite")
		end,
	})
end

-- Copy to OS Clipboard on yank
vim.api.nvim_create_autocmd("TextYankPost", {
	callback = function()
		local yanked = vim.fn.getreg('"')
		local type = vim.fn.getregtype('"')
		vim.fn.setreg("+", yanked, type)
	end,
	desc = "Copy yanked text to system clipboard (+)",
})

-- Flutter tools lsp
vim.api.nvim_create_autocmd("VimEnter", {
	pattern = "*",
	callback = function()
		if vim.g.use_flutter_tools then
			require("hexide.lsp.flutter-tools")
		else
			local opts = {
				on_attach = require("hexide.lsp.handlers").on_attach,
				capabilities = require("hexide.lsp.handlers").capabilities,
			}
			vim.lsp.config("dartls", opts)
			vim.lsp.enable("dartls")
		end
	end,
})

return M
