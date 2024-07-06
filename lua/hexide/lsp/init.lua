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
	"golangci_lint_ls", -- Go Lint
	"html", -- HTML
	"tailwindcss", -- Tailwind Css Library
	"tsserver", -- Typescript and Javascript
	"volar", -- Vue 3
	"yamlls", -- Yaml schema | Setup Schema
	"lua_ls", -- lua
	"jsonls", -- Json schema
	"cssls", -- Css
	-- "solargraph", -- Ruby
	"prismals", -- Prisma
	-- "pylsp", -- Python
	"astro",
	"terraformls",
}

local formattingServers = {
	"prettier",
	"stylua",
	"goimports",
	-- "autopep8", -- Yet another python formatter
	-- "rubocop",
}
local diagonosticServer = {
	"golangci-lint", -- needed for golangci_lint_ls
	-- "mypy", -- Python linter for types
	-- "cspell",
}
local tableUtils = require("hexide.utils.table")

local nonLspServers = tableUtils.spreadTables(formattingServers, diagonosticServer)

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
require("hexide.lsp.flutter-tools")
