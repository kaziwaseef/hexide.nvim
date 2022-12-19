require("mason").setup({
	ui = {
		icons = {
			package_installed = "✓",
			package_pending = "➜",
			package_uninstalled = "✗",
		},
		border = "rounded",
	},
})

local lspServers = {
	"bashls", -- Bash
	"dockerls", -- Docker
	"graphql", -- Graphql
	"gopls", -- Go
	"html", -- HTML
	"rust_analyzer", -- Rust
	"tailwindcss", -- Tailwind Css Library
	-- "terraformls", -- Terraform (Public API)
	"tsserver", -- Typescript and Javascript
	"volar", -- Vue 3
	"yamlls", -- Yaml schema | Setup Schema
	"sumneko_lua", -- lua
	"jsonls", -- Json schema
	-- "cssls"
	"solargraph",
	"prismals",
}

local nonLspServers = {
	"prettier",
	"stylua",
	"goimports",
	-- "rubocop",
}

require("mason-tool-installer").setup({
	ensure_installed = nonLspServers,
	auto_update = true,
	run_on_start = true,
})

require("mason-lspconfig").setup({
	ensure_installed = lspServers,
	automatic_installation = true,
})

for _, server in pairs(lspServers) do
	local opts = {
		on_attach = require("rawnvim.lsp.handlers").on_attach,
		capabilities = require("rawnvim.lsp.handlers").capabilities,
	}

	if server == "html" or server == "cssls" then
		opts.capabilities.textDocument.completion.completionItem.snippetSupport = true
	end

	local has_custom_opts, server_custom_opts = pcall(require, "rawnvim.lsp.settings." .. server)
	if has_custom_opts then
		opts = vim.tbl_deep_extend("force", opts, server_custom_opts)
	end
	require("lspconfig")[server].setup(opts)
end

require("rawnvim.lsp.handlers").setup()
require("rawnvim.lsp.flutter-tools")
