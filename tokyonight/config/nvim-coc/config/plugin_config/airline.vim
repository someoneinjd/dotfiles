let g:airline#extensions#tabline#enabled=1
let g:airline_powerline_fonts=1
let g:airline#extensions#tabline#formatter = 'unique_tail'
nmap <M-p> <Plug>AirlineSelectPrevTab
nmap <M-n> <Plug>AirlineSelectNextTab
nnoremap <M-d> :bwipe<CR>
