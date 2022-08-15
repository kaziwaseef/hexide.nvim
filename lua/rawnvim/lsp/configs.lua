local Model = {}

local lspconfig = require("lspconfig")

function Model.setup (servers)
  for _, server in pairs(servers) do
	  local opts = {
		  on_attach = require("rawnvim.lsp.handlers").on_attach,
		  capabilities = require("rawnvim.lsp.handlers").capabilities,
	  }
	  local has_custom_opts, server_custom_opts = pcall(require, "rawnvim.lsp.settings." .. server)
	  if has_custom_opts then
		  opts = vim.tbl_deep_extend("force", opts, server_custom_opts)
	  end
	  lspconfig[server].setup(opts)
  end
end

