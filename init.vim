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
Plug 'ap/vim-css-color' " Css color highlight
Plug 'tpope/vim-surround' " Surround with quotes and stuff
Plug 'mg979/vim-visual-multi' " Multi cursor for vim

set encoding=UTF-8

call plug#end()

noremap <C-t> :NERDTreeToggle<cr>
nnoremap <C-s> <C-c>:w<cr>
vnoremap <C-s> <C-c>:w<cr>
inoremap <C-s> <C-c>:w<cr>
vnoremap <C-y> "*y

:colorscheme jellybeans
