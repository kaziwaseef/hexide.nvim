require("flutter-tools").setup({
	fvm = false,
	widget_guides = {
		enabled = true,
	},
})
require("hexide.nvim.lsp.settings.flutter")
