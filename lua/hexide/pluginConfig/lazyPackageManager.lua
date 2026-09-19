local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
        "--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=v11.17.5", -- tag; update manually: fetch tags + checkout in stdpath("data")/lazy/lazy.nvim
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)
