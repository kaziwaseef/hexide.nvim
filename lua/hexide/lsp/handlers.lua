local M = {}

function M.setup()
	local config = {
		-- disable virtual text
		virtual_text = false,
		-- show signs
		signs = {
			text = {
				[vim.diagnostic.severity.ERROR] = "\u{f057}",
				[vim.diagnostic.severity.WARN] = "\u{f071}",
				[vim.diagnostic.severity.HINT] = "\u{f059}",
				[vim.diagnostic.severity.INFO] = "\u{f05a}",
			},
		},
		update_in_insert = true,
		underline = true,
		severity_sort = true,
		float = {
			focusable = true,
			style = "minimal",
			border = "rounded",
			source = "always",
			-- header = "",
			-- prefix = "",
		},
	}

	vim.diagnostic.config(config)
end

local function lsp_keymaps(bufnr)
	local opts = { noremap = true, silent = true }
	local keymap = vim.api.nvim_buf_set_keymap
	keymap(bufnr, "n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", opts)
	keymap(bufnr, "n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", opts)
	keymap(bufnr, "n", "K", "<cmd>lua vim.lsp.buf.hover({ border = 'rounded' })<CR>", opts)
	keymap(bufnr, "n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts)
	-- keymap(bufnr, "n", "<C-k>", "<cmd>lua vim.lsp.buf.signature_help({ border = 'rounded' })<CR>", opts)
	keymap(bufnr, "n", "<leader>rn", "<cmd>lua vim.lsp.buf.rename()<CR>", opts)
	-- keymap(bufnr, "n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", opts)
	keymap(bufnr, "n", "<leader>ca", "<cmd>lua vim.lsp.buf.code_action()<CR>", opts)
	keymap(bufnr, "n", "[d", '<cmd>lua vim.diagnostic.goto_prev({ float = { border = "rounded" } })<CR>', opts)
	keymap(bufnr, "n", "gl", '<cmd>lua vim.diagnostic.open_float({ border = "rounded" })<CR>', opts)
	keymap(bufnr, "n", "]d", '<cmd>lua vim.diagnostic.goto_next({ float = { border = "rounded" } })<CR>', opts)
end
---@diagnostic disable-next-line: unused-local
function M.on_attach(client, bufnr)
	-- if client.name ~= "null-ls" and client.name ~= "prismals" then
	-- 	client.server_capabilities.documentFormattingProvider = false
	-- end
	vim.api.nvim_set_option_value("omnifunc", "v:lua.vim.lsp.omnifunc", { buf = bufnr })
	vim.api.nvim_set_option_value("tagfunc", "v:lua.vim.lsp.tagfunc", { buf = bufnr })
	lsp_keymaps(bufnr)
	-- lsp_highlight_document(client)
end

local capabilities = vim.lsp.protocol.make_client_capabilities()

local status_ok, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
if not status_ok then
	error("CMP NVIM LSP")
	return
end

M.capabilities = cmp_nvim_lsp.default_capabilities(capabilities)

return M
