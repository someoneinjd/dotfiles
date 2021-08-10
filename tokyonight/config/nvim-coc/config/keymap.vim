"airline
nmap <silent> <M-p> <Plug>AirlineSelectPrevTab
nmap <silent> <M-n> <Plug>AirlineSelectNextTab
nnoremap <silent> <M-d> :bwipe<CR>

"coc
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
nmap <silent> gn <Plug>(coc-diagnostic-next-error)
nmap <silent> <M-r> <Plug>(coc-rename)

nnoremap <silent> K :call CocAction('doHover')<CR>
nnoremap <silent> <M-k> :call CocActionAsync('showSignatureHelp')<CR>


inoremap <silent><expr> <CR> pumvisible() ? coc#_select_confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

inoremap <silent><expr> <TAB>
      \ pumvisible() ? coc#_select_confirm() :
      \ coc#expandableOrJumpable() ? "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

let g:coc_snippet_next = '<TAB>'

nnoremap <silent><nowait> <Leader>xx  :<C-u>CocList diagnostics<CR>
nnoremap <silent><nowait> <Leader>fs  :<C-u>CocList -I symbols<CR>

"coc-explorer
nnoremap <silent> <M-e> :CocCommand explorer --preset floating<CR>

"floaterm
nnoremap <silent> <M-t> :FloatermNew<CR>

"neoformat
nnoremap <silent> <M-f> :Neoformat<CR>
