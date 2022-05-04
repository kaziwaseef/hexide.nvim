:set number
:set relativenumber
:set autoindent
:set tabstop=4
:set shiftwidth=4
:set smarttab
:set softtabstop=4
:set mouse=a

let g:doom_one_terminal_colors = v:true

set termguicolors

call plug#begin()

Plug 'vim-airline/vim-airline' " Status bar
Plug 'preservim/nerdtree' " NerdTree Left Sidebar
Plug 'tpope/vim-commentary' " Comments
Plug 'Xuyuanp/nerdtree-git-plugin' " Git in nerdtree
Plug 'ryanoasis/vim-devicons' " Icons
Plug 'ap/vim-css-color' " Css color highlight
Plug 'tpope/vim-surround' " Surround with quotes and stuff
Plug 'mg979/vim-visual-multi' " Multi cursor for vim
Plug 'kyazdani42/nvim-web-devicons'
Plug 'romgrk/barbar.nvim'
Plug 'romgrk/doom-one.vim'

set encoding=UTF-8

call plug#end()

set hidden

" NERDtree
noremap <C-t> :NERDTreeToggle<cr>

" Saving
nnoremap <C-s> <C-c>:w<cr>
vnoremap <C-s> <C-c>:w<cr>
inoremap <C-s> <C-c>:w<cr>

" Copy to OS clipboard
vnoremap <C-y> "*y

" Comment
nmap <C-e> gcc 
vmap <C-e> gcgv
imap <C-e> <C-c>gcc

:colorscheme doom-one

