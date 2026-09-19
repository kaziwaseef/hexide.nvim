require("hexide.option")
require("hexide.osKeyMap").setup()
require("hexide.keymap")
require("hexide.plugin")
require("hexide.colorscheme")
require("hexide.lsp")
require("hexide.autocommands")

-- Remove builtin LSP gr* defaults (grn/gra/grr/gri) in normal + visual modes so
-- ReplaceWithRegister's `gr` operator has no prefix ambiguity (timeoutlen wait).
-- We already have equivalents: <leader>rn, <leader>ca, <leader>gr, gi.
for _, lhs in ipairs({ "grn", "gra", "grr", "gri" }) do
	for _, mode in ipairs({ "n", "v" }) do
		pcall(vim.keymap.del, mode, lhs)
	end
end
