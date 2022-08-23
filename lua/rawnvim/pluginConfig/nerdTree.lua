local opts = { noremap = true, silent = true }

local keymap = vim.api.nvim_set_keymap

-- Alacritty Map
local map = require("rawnvim.osKeyMap").mapping

-- Toggle NERDtree
keymap("n", map.CMD_t, ":NERDTreeToggle<CR>", opts)
-- Find and Focus file in NERDtree
keymap("n", map.CMD_SHIFT_T, ":NERDTreeFind<CR>", opts)

vim.g["NERDTreeShowHidden"] = 1
vim.g["NERDTreeMinimalUI"] = 1
vim.g["NERDTreeWinPos"] = "right"
vim.g["NERDTreeIgnore"] = { ".DS_Store" }

vim.g["NERDTreeGitStatusUseNerdFonts"] = 1
vim.g["NERDTreeGitStatusShowIgnored"] = 1
vim.g["NERDTreeGitStatusIndicatorMapCustom"] = {
	Modified = "✹",
	Staged = "✚",
	Untracked = "✭",
	Renamed = "➜",
	Unmerged = "═",
	Deleted = "✖",
	Dirty = "✗",
	Ignored = "",
	Clean = "✔︎",
	Unknown = "?",
}

-- Close nvim if NERDtree is the last buffer
vim.api.nvim_command(
	"autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif"
)

-- Find file in NERDtree if buffer opened
vim.cmd([[
    function! IsNERDTreeOpen()        
        return exists("t:NERDTreeBufName") && (bufwinnr(t:NERDTreeBufName) != -1)
    endfunction

    function! SyncTree()
        if &modifiable && IsNERDTreeOpen() && strlen(expand('%')) > 0 && !&diff
            NERDTreeFind
            wincmd p
        endif
    endfunction

    autocmd BufRead * call SyncTree()
]])

-- Open the existing NERDTree on each new tab.
vim.cmd([[
    autocmd BufWinEnter * if getcmdwintype() == '' | silent NERDTreeMirror | endif
]])
