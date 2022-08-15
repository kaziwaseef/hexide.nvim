local status_ok, _ = pcall(require, "lspconfig")
if not status_ok then
	return
end

require("rawnvim.lsp.lsp-installer")
require("rawnvim.lsp.handlers").setup()

