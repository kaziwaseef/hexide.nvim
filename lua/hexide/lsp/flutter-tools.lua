require("flutter-tools").setup({
	fvm = false,
	flutter_lookup_cmd = "asdf where flutter",
	widget_guides = {
		enabled = true,
	},
})
require("hexide.lsp.settings.flutter")
