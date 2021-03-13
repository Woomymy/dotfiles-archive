call plug#begin(stdpath('data') . '/plugged')
Plug 'ntk148v/vim-horizon'
Plug 'vim-airline/vim-airline'
Plug 'ryanoasis/vim-devicons'
Plug 'kien/rainbow_parentheses.vim'
Plug 'vim-airline/vim-airline-themes'
Plug 'scrooloose/nerdtree'
call plug#end()
set termguicolors
source ~/.config/nvim/ext/fileexp.vim
colorscheme horizon
let g:lightline = {'colorscheme' : 'horizon'}
set number
let g:airline_theme="onedark"
