syntax on
filetype indent on
filetype plugin on


set encoding=utf-8
set fileencoding=utf-8
set fileencodings=utf-8,gb18030,big5,euc-jp,euc-kr,latin1

set rnu
set autoindent
set smartindent
set noswapfile
set shiftwidth=4
set smarttab
set tabstop=4
set expandtab
set showmatch
set cursorline
set termguicolors
set noshowmode
set nowrap
set clipboard+=unnamedplus
set linebreak
set showbreak=↪

nnoremap <M-p> <CMD>tabprevious<CR>
nnoremap <M-n> <CMD>tabnext<CR>
nnoremap <M-d> <CMD>bwipe<CR>
nnoremap <M-t> <CMD>term<CR>
nnoremap <M-e> <CMD>edit ./<CR>

if exists('##TermOpen')
    augroup term_settings
        autocmd!
        " Do not use number and relative number for terminal inside nvim
        autocmd TermOpen * setlocal norelativenumber
        " Go to insert mode by default to start typing command
        autocmd TermOpen * startinsert
    augroup END
endif


let g:currentmode={
       \ 'n'  : 'NORMAL ',
       \ 'v'  : 'VISUAL ',
       \ 'V'  : 'V-Line ',
       \ "\<C-V>" : 'V-Block ',
       \ 'i'  : 'INSERT ',
       \ 'R'  : 'R ',
       \ 'Rv' : 'V-Replace ',
       \ 'c'  : 'Command ',
       \ 't'  : 'Term ',
       \}

set statusline=
set statusline+=%1*
" Show current mode
set statusline+=\ %{toupper(g:currentmode[mode()])}

set statusline+=%2*
" File path, as typed or relative to current directory
set statusline+=\ %F
set statusline+=%{&modified?'\ [+]':''}
set statusline+=%{&readonly?'\ []':''}

" Truncate line here
set statusline+=%<

" Separation point between left and right aligned items.
set statusline+=%=

set statusline+=%{&filetype!=#''?&filetype.'\ ':'none\ '}

set statusline+=%2*
set statusline+=%-7([%{&fileformat}]%)

" Warning about byte order

set statusline+=%1*
" Location of cursor line
set statusline+=[%l/%L]

" Column number
set statusline+=\ col:%2c
