return {
	-- cmd = {
	-- 	"typescript-language-server",
	-- 	"--tsserver-log-file=ts-log.log",
	-- 	"--tsserver-log-verbosity=verbose",
	-- 	"--stdio",
	-- },
	init_options = {
		hostInfo = "neovim",
		-- logVerbosity = "verbose",
		maxTsServerMemory = 6000,
	},
}
