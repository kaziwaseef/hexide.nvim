set number
set relativenumber
set autoindent
set tabstop=4
set shiftwidth=4
set smarttab
set softtabstop=4
set expandtab
set mouse=a
set scrolloff=6
set exrc
set signcolumn=yes
set nospell " For splunker and default to not clash

let g:doom_one_terminal_colors = v:true

set termguicolors

let mapleader = " "

" Dashboard
let g:dashboard_default_executive='fzf'

fun! SetupCommandAlias(from, to)
  exec 'cnoreabbrev <expr> '.a:from
        \ .' ((getcmdtype() is# ":" && getcmdline() is# "'.a:from.'")'
        \ .'? ("'.a:to.'") : ("'.a:from.'"))'
endfun
call SetupCommandAlias("git","Git")

call plug#begin()
Plug 'vim-airline/vim-airline' " Status bar
Plug 'preservim/nerdtree' " NerdTree Left Sidebar
Plug 'tpope/vim-commentary' " Comments
Plug 'Xuyuanp/nerdtree-git-plugin' " Git in nerdtree
Plug 'ryanoasis/vim-devicons' " Icons
Plug 'ap/vim-css-color' " Css color highlight
Plug 'tpope/vim-surround' " Surround with quotes and stuff
Plug 'kyazdani42/nvim-web-devicons' " Tab bar icons
Plug 'romgrk/barbar.nvim' " Tab Plugin
Plug 'romgrk/doom-one.vim' " Theme
Plug 'neoclide/coc.nvim', {'branch': 'release'} " The COC
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } } " Fuzzy Find
Plug 'junegunn/fzf.vim' " Fuzzy Find Vim
Plug 'glepnir/dashboard-nvim' " Dashboard
Plug 'airblade/vim-gitgutter' " Git Sidebar
Plug 'tpope/vim-fugitive' " Git Commands
Plug 'jparise/vim-graphql' " GraphQl Syntax Highlight and stuff
Plug 'prettier/vim-prettier', { 'do': 'yarn install' } " Prettier
Plug 'kamykn/spelunker.vim'

set encoding=UTF-8

call plug#end()

let g:python3_host_prog='/opt/homebrew/bin/python3'

set hidden

" Splits
" Movement
nnoremap <C-j> <C-w><C-j>
nnoremap <C-k> <C-w><C-k>
nnoremap <C-l> <C-w><C-l>
nnoremap <C-h> <C-w><C-h>
" Make split
nnoremap √ <C-w><C-v>
nnoremap ß <C-w><C-s>

" Prettier
let g:prettier#quickfix_enabled = 0

let g:prettier#autoformat = 0
autocmd BufWritePre,InsertLeave *.js,*.jsx,*.mjs,*.ts,*.tsx,*.css,*.less,*.scss,*.json,*.graphql,*.md PrettierAsync

" Coc Pair
autocmd FileType markdown let b:coc_pairs_disabled = ['`']

" NERDtree
noremap † :NERDTreeToggle<cr>
noremap <C-t> :NERDTreeFind<cr>
let NERDTreeShowHidden=1
let NERDTreeMinimalUI=1
let g:NERDTreeWinPos='right'

" Check if NERDTree is open or active
function! IsNERDTreeOpen()        
  return exists("t:NERDTreeBufName") && (bufwinnr(t:NERDTreeBufName) != -1)
endfunction

" Call NERDTreeFind iff NERDTree is active, current window contains a modifiable
" file, and we're not in vimdiff
function! SyncTree()
  if &modifiable && IsNERDTreeOpen() && strlen(expand('%')) > 0 && !&diff
    NERDTreeFind
    wincmd p
  endif
endfunction

" Highlight currently open buffer in NERDTree
autocmd BufRead * call SyncTree()

" Saving
nnoremap <C-s> <C-c>:w<cr>
vnoremap <C-s> <C-c>:w<cr>
inoremap <C-s> <C-c>:w<cr>

" Copy to OS clipboard
" Cmd + c
vnoremap <C-y> "*y

" Comment
" Cmd + /
nmap <C-e> gcc
" Cmd + /
vmap <C-e> gcgv
" Cmd + /
imap <C-e> <C-c>gcc

" Moving Lines
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv

" Color scheme
:colorscheme doom-one

" FzF

" Cmd + p
nmap <C-p> :Files<cr>
" Cmd + Shift + P
nmap ++    :Buffers<cr>
" Cmd + f 
nmap +-    :BLines<cr>
" Cmd + Shift + f
nmap +f    :Rg<cr>

" Barbar

" Move to previous/next
" Opt + ,
nnoremap ≤ :BufferPrevious<CR>
" Opt + .
nnoremap ≥ :BufferNext<CR>
" Re-order to previous/next
" Opt + <
nnoremap ¯ :BufferMovePrevious<CR>
" Opt + <
nnoremap ˘ :BufferMoveNext<CR>

" Goto buffer in position...
" <A-1> 
nnoremap ¡ :BufferGoto 1<CR>
" <A-2> 
nnoremap ™ :BufferGoto 2<CR>
" <A-3> 
nnoremap £ :BufferGoto 3<CR>
" <A-4> 
nnoremap ¢ :BufferGoto 4<CR>
" <A-5> 
nnoremap ∞ :BufferGoto 5<CR>
" <A-6> 
nnoremap § :BufferGoto 6<CR>
" <A-7> 
nnoremap ¶ :BufferGoto 7<CR>
" <A-8> 
nnoremap • :BufferGoto 8<CR>
" <A-9> 
nnoremap ª :BufferLast<CR>
" <A-p> 
nnoremap π :BufferPin<CR>
" <A-w> 
nnoremap ∑ :BufferClose<CR>

" COC

" Some servers have issues with backup files, see #649.
set nobackup
set nowritebackup

" Give more space for displaying messages.
set cmdheight=1

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
imap <expr>  coc#refresh()

" Make <CR> auto-select the first completion item and notify coc.nvim to
" format on enter, <cr> could be remapped by other vim plugin
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if CocAction('hasProvider', 'hover')
    call CocActionAsync('doHover')
  else
    call feedkeys('K', 'in')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap keys for applying codeAction to the current buffer.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

" Run the Code Lens action on the current line.
nmap <leader>cl  <Plug>(coc-codelens-action)

" Map function and class text objects
" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)

" Remap <C-f> and <C-b> for scroll float windows/popups.
if has('nvim-0.4.0') || has('patch-8.2.0750')
  nnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  nnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
  inoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
  inoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
  vnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  vnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
endif

" Use CTRL-S for selections ranges.
" Requires 'textDocument/selectionRange' support of language server.
" nmap <silent> <C-s> <Plug>(coc-range-select)
" xmap <silent> <C-s> <Plug>(coc-range-select)

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocActionAsync('format')

" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocActionAsync('runCommand', 'editor.action.organizeImport')

" Add (Neo)Vim's native statusline support.
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline.
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Mappings for CoCList
" Show all diagnostics.
nnoremap <silent><nowait> <leader>a  :<C-u>CocList diagnostics<cr>
" Manage extensions.
nnoremap <silent><nowait> <leader>e  :<C-u>CocList extensions<cr>
" Show commands.
nnoremap <silent><nowait> <leader>c  :<C-u>CocList commands<cr>
" Find symbol of current document.
nnoremap <silent><nowait> <leader>o  :<C-u>CocList outline<cr>
" Search workspace symbols.
nnoremap <silent><nowait> <leader>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent><nowait> <leader>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent><nowait> <leader>k  :<C-u>CocPrev<CR>
" Resume latest coc list.
nnoremap <silent><nowait> <leader>p  :<C-u>CocListResume<CR>

hi! CocErrorSign guifg=#d1666a

" let g:node_client_debug = 1
" let g:coc_node_args = ['--olazy', '--inspect=6045']
