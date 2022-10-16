filetype off
syntax on
set nocompatible
set nu
set background=dark
set ruler
set showcmd
set cursorline


call plug#begin()

Plug 'junegunn/vim-easy-align'
Plug 'junegunn/fzf'
Plug 'ervandew/supertab'
Plug 'honza/vim-snippets'
Plug 'tomtom/tlib_vim'
Plug 'raimondi/delimitmate'
Plug 'mattn/emmet-vim'
Plug 'preservim/nerdtree'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'majutsushi/tagbar'


call plug#end()

let g:airline_theme='minimalist'
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#formatter = 'default'

let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'

let g:ctrlp_show_hidden=1

nnoremap <leader>n :NERDTreeFocus<CR>
nnoremap <C-n> :NERDTreeToggle<CR>
