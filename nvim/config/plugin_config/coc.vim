nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <plug>(coc-type-definition)
nmap <silent> gi <plug>(coc-implementation)
nmap <silent> gr <plug>(coc-references)
nmap <silent> <M-r> <Plug>(coc-rename)

nnoremap <silent> K :call CocAction('doHover')<CR>
nnoremap <silent> <M-k> :call CocActionAsync('showSignatureHelp')<CR>
