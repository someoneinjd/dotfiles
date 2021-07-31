nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
nmap <silent> gn <Plug>(coc-diagnostic-next-error)
nmap <silent> <M-r> <Plug>(coc-rename)

nnoremap <silent> K :call CocAction('doHover')<CR>
nnoremap <silent> <M-k> :call CocActionAsync('showSignatureHelp')<CR>
