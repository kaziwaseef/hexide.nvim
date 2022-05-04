:set number
:set relativenumber
:set autoindent
:set tabstop=4
:set shiftwidth=4
:set smarttab
:set softtabstop=4
:set mouse=a

call plug#begin()

Plug 'vim-airline/vim-airline' " Status bar
Plug 'preservim/nerdtree' " NerdTree Left Sidebar
Plug 'rafi/awesome-vim-colorschemes' " Color Scheme
Plug 'tpope/vim-commentary' " Comments
Plug 'Xuyuanp/nerdtree-git-plugin' " Git in nerdtree
Plug 'ryanoasis/vim-devicons' " Icons

set encoding=UTF-8

call plug#end()

"nnoremap <C-f> :NERDTreeFocus<CR>
"nnoremap <C-n> :NERDTree<CR>
nnoremap <C-t> :NERDTreeToggle<CR>
nnoremap <C-s> <C-c>:w<cr>
vnoremap <C-s> <C-c>:w<cr>
inoremap <C-s> <C-c>:w<cr>

:colorscheme jellybeans
