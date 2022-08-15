require("mason").setup({
    ui = {
        icons = {
            package_installed = "✓",
            package_pending = "➜",
            package_uninstalled = "✗"
        }
    }
})

local servers = {
    "bashls", -- Bash
    "cssls",  -- CSS | Setup Completion
    "dockerls", -- Docker
    "eslint", -- Eslint
    "graphql", -- Graphql
    "gopls", -- Go
    "html", -- HTML | Setup Completion
    "quick_lint_js", -- Javascript Bug Finder
    "rust_analyzer", -- Rust
    "tailwindcss", -- Tailwind Css Library
    "terraformls", -- Terraform (Public API)
    "tsserver", -- Typescript and Javascript
    -- "volar", -- Vue 3 | Setup Take Over Mode
    "yamlls", -- Yaml schema | Setup Schema
    "sumneko_lua", -- lua
    "jsonls", -- Json schema
}

require("mason-lspconfig").setup({
  ensure_installed = servers,
  automatic_installation = true,
})


for _, server in pairs(servers) do
  local opts = {
	  on_attach = require("rawnvim.lsp.handlers").on_attach,
	  capabilities = require("rawnvim.lsp.handlers").capabilities,
  }
  
  if server == 'html' or server == 'cssls' then
    opts.capabilities.textDocument.completion.completionItem.snippetSupport = true
  end
  
  local has_custom_opts, server_custom_opts = pcall(require, "rawnvim.lsp.settings." .. server)
  if has_custom_opts then
	  opts = vim.tbl_deep_extend("force", opts, server_custom_opts)
  end
  require('lspconfig')[server].setup(opts)
end

require("rawnvim.lsp.handlers").setup()
