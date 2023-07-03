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
	"tailwindcss", -- Tailwind Css Library
	"tsserver", -- Typescript and Javascript
	"volar", -- Vue 3
	"yamlls", -- Yaml schema | Setup Schema
	"lua_ls", -- lua
	"jsonls", -- Json schema
	"cssls", -- Css
	"solargraph", -- Ruby
	"prismals", -- Prisma
	"pylsp", -- Python
}

local nonLspServers = {
	"prettier",
	"stylua",
	"goimports",
	"golangci-lint",
	"autopep8", -- Yet another python formatter
	"mypy", -- Python linter for types
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
		on_attach = require("hexide.lsp.handlers").on_attach,
		capabilities = require("hexide.lsp.handlers").capabilities,
	}

	if server == "html" or server == "cssls" then
		opts.capabilities.textDocument.completion.completionItem.snippetSupport = true
	end

	local has_custom_opts, server_custom_opts = pcall(require, "hexide.lsp.settings." .. server)
	if has_custom_opts then
		opts = vim.tbl_deep_extend("force", opts, server_custom_opts)
	end
	require("lspconfig")[server].setup(opts)
end

require("hexide.lsp.handlers").setup()
require("lspconfig").dartls.setup(require("hexide.lsp.settings.dartls"))
require("hexide.lsp.flutter-tools")
