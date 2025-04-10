" Basic {{{
set nocompatible
filetype on
filetype plugin on
filetype indent on
syntax on
set number
set cursorline
set cursorcolumn
set shiftwidth=4
set tabstop=4
set nobackup
set incsearch
set scrolloff=10
set showcmd
set showmode
set showmatch
set hlsearch
set history=1000
set splitbelow

set listchars=tab:>>,lead:.,trail:.
set list

" }}}

" Fold {{{
set foldmethod=indent
autocmd FileType vim setlocal foldmethod=marker
set foldlevel=2 " fold only in deeper blocks
" }}}

" Wildmenu {{{
set wildmenu
set wildmode=list:longest
set wildignore=*.docx,*.jpg,*.png,*.gif,*.pdf,*.pyc,*.exe,*.flv,*.img,*.xlsx,*.swp
" }}}

" Statusline {{{
set statusline=
set statusline+=\ %F\ %M\ %Y\ %R
set statusline+=%=
set statusline+=\ ascii:\ %b\ hex:\ 0x%B\ row:\ %l\ col:\ %c\ percent:\ %p%%
set laststatus=2
" }}}

" Plugin {{{
call plug#begin('~/.vim/plugged')

" File-system tree
Plug 'preservim/nerdtree'

" Linter
Plug 'dense-analysis/ale'

" Language packs
Plug 'sheerun/vim-polyglot'

Plug 'jiangmiao/auto-pairs'

" Color scheme 'everforest' (The best vim color scheme!)
Plug 'sainnhe/everforest'

call plug#end()
" }}}

" Colorscheme {{{
if has('termguicolors')
    set termguicolors
endif
set background=dark
let g:everforest_background = 'medium'
let g:everforest_better_performance = 1
colorscheme everforest
" }}}

" NERDTree {{{
let NERDTreeAutoCenter=1
let NERDTreeShowFiles=1
let NERDTreeShowHidden=1
let NERDTreeHighlightCursorline=0
let NERDTreeRespectWildIgnore=1 " Using wild ignore

" Open NERDTree when open a file using 'vim'
autocmd VimEnter * NERDTree | wincmd p
" Close tab when NERDTree is the only window
autocmd BufEnter * if winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | call feedkeys(":quit\<CR>:\<BS>") | endif
" If another buffer tries to replace NERDTree, put it in the other window, and bring back NERDTree.
autocmd BufEnter * if winnr() == winnr('h') && bufname('#') =~ 'NERD_tree_\d\+' && bufname('%') !~ 'NERD_tree_\d\+' && winnr('$') > 1 |
    \ let buf=bufnr() | buffer# | execute "normal! \<C-W>w" | execute 'buffer'.buf | endif
" Open the existing NERDTree on each new tab.
autocmd BufWinEnter * if &buftype != 'quickfix' && getcmdwintype() == '' | silent NERDTreeMirror | endif
" }}}

" Ale {{{
let g:ale_lint_on_text_changed = 'never'
let g:ale_lint_on_insert_leave = 0
" }}}

