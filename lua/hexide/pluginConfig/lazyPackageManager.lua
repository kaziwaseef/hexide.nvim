local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
        "--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=v9.24.2", -- tag
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)
