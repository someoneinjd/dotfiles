call plug#begin('~/.vim/plugged')
Plug 'preservim/nerdtree'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'rhysd/vim-clang-format'
Plug 'morhetz/gruvbox'
Plug 'ryanoasis/vim-devicons'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'jackguo380/vim-lsp-cxx-highlight'
call plug#end()

set rnu
set cursorline
set shiftwidth=4
set autoindent
set tabstop=4
set expandtab
set softtabstop=4
filetype indent on
syntax on
set encoding=utf-8
set noswapfile
set nowrap
set termguicolors
set background=dark
colorscheme gruvbox
let g:airline_powerline_fonts=1

let g:clang_format#style_options={
            \ "BasedOnStyle": "LLVM",
            \ "UseTab": "Never",
            \ "IndentWidth": 4,
            \ "TabWidth": 4,
            \ "BreakBeforeBraces": "Allman",
            \ "AllowShortIfStatementsOnASingleLine": "false",
            \ "IndentCaseLabels": "false",
            \ "ColumnLimit": 0,
            \ "AccessModifierOffset": -4
            \ }
