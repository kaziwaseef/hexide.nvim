vim.env.PATH = vim.env.HOME .. "/.asdf/shims:" .. vim.env.PATH

local lspServers = {
	"bashls", -- Bash
	"dockerls", -- Docker
	"graphql", -- Graphql
	"gopls", -- Go
	"golangci_lint_ls", -- Go Lint
	"html", -- HTML
	"tailwindcss", -- Tailwind Css Library
	"ts_ls", -- Typescript and Javascript
	"yamlls", -- Yaml schema | Setup Schema
	"lua_ls", -- lua
	"jsonls", -- Json schema
	"cssls", -- Css
	"astro",
	"terraformls",
}

local installers = require("hexide.lsp.installers")
local missing = {}

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
	vim.lsp.config(server, opts)
	if installers.is_available(server) then
		vim.lsp.enable(server)
	else
		table.insert(missing, server)
	end
end

if #missing > 0 then
	vim.schedule(function()
		vim.notify(
			"Missing LSP servers: " .. table.concat(missing, ", ") .. "\nRun :HexideLspInstall to install them.",
			vim.log.levels.WARN
		)
	end)
end

local function install_one(server)
	installers.install(server, function(ok, msg)
		vim.notify(msg, ok and vim.log.levels.INFO or vim.log.levels.ERROR)
		if ok and installers.is_available(server) then
			missing = vim.tbl_filter(function(s)
				return s ~= server
			end, missing)
			vim.lsp.enable(server)
		end
	end)
end

vim.api.nvim_create_user_command("HexideLspInstall", function(args)
	local targets = args.args ~= "" and { args.args } or vim.deepcopy(missing)
	if #targets == 0 then
		vim.notify("No missing LSP servers", vim.log.levels.INFO)
		return
	end
	for _, server in ipairs(targets) do
		vim.notify("Installing " .. server .. "...", vim.log.levels.INFO)
		install_one(server)
	end
end, {
	nargs = "?",
	desc = "Install missing LSP servers",
	complete = function()
		return vim.deepcopy(missing)
	end,
})

vim.api.nvim_create_user_command("HexideLspStatus", function()
	local lines = {}
	for _, server in ipairs(lspServers) do
		table.insert(lines, (vim.tbl_contains(missing, server) and "missing    " or "installed  ") .. server)
	end
	vim.notify(table.concat(lines, "\n"), vim.log.levels.INFO)
end, { desc = "Show LSP server install status" })

require("hexide.lsp.handlers").setup()
