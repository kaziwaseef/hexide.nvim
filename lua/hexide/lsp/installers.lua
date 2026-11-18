-- Install recipes and availability checks for language servers.
-- `cmd` is run with vim.system (argv list). Servers without a recipe get a manual hint.
local M = {}

local npm = function(...)
	return { cmd = { "npm", "install", "-g", ... } }
end

M.recipes = {
	bashls = npm("bash-language-server"),
	dockerls = npm("dockerfile-language-server-nodejs"),
	graphql = npm("graphql-language-service-cli"),
	html = npm("vscode-langservers-extracted"),
	cssls = npm("vscode-langservers-extracted"),
	jsonls = npm("vscode-langservers-extracted"),
	tailwindcss = npm("@tailwindcss/language-server"),
	ts_ls = npm("typescript", "typescript-language-server"),
	yamlls = npm("yaml-language-server"),
	astro = npm("@astrojs/language-server"),
	gopls = { cmd = { "go", "install", "golang.org/x/tools/gopls@latest" } },
	golangci_lint_ls = {
		cmd = { "go", "install", "github.com/nametake/golangci-lint-langserver@latest" },
	},
	lua_ls = { cmd = { "brew", "install", "lua-language-server" } },
	terraformls = { cmd = { "brew", "install", "hashicorp/tap/terraform-ls" } },
}

local function server_bin(server)
	local ok, cfg = pcall(function()
		return vim.lsp.config[server]
	end)
	local cmd = ok and cfg and cfg.cmd
	if type(cmd) == "table" then
		return cmd[1]
	end
	return nil
end

-- True when the server's binary can really run. An asdf shim exists even when
-- no version is installed, so shims are confirmed with `asdf which`.
-- Unknown cmd (function or nil) counts as available so we never block a server.
function M.is_available(server)
	local bin = server_bin(server)
	if not bin then
		return true
	end
	local path = vim.fn.exepath(bin)
	if path == "" then
		return false
	end
	if path:find("/.asdf/shims/", 1, true) and vim.fn.executable("asdf") == 1 then
		local res = vim.system({ "asdf", "which", vim.fn.fnamemodify(bin, ":t") }, { text = true }):wait()
		return res.code == 0
	end
	return true
end

-- Runs the install recipe asynchronously. on_done(ok, message)
function M.install(server, on_done)
	local recipe = M.recipes[server]
	if not recipe then
		on_done(false, "no install recipe for " .. server .. "; install it manually")
		return
	end
	if vim.fn.executable(recipe.cmd[1]) ~= 1 then
		on_done(false, recipe.cmd[1] .. " is not available; needed to install " .. server)
		return
	end
	vim.system(recipe.cmd, { text = true }, function(res)
		if res.code == 0 and vim.fn.executable("asdf") == 1 then
			vim.system({ "asdf", "reshim" }):wait()
		end
		vim.schedule(function()
			if res.code == 0 then
				on_done(true, "installed " .. server)
			else
				on_done(false, ("install of %s failed (%s): %s"):format(server, table.concat(recipe.cmd, " "), vim.trim(res.stderr or "")))
			end
		end)
	end)
end

return M
