let g:coc_explorer_global_presets = {
        \   '.vim': {
        \      'root-uri': '~/.config/nvim',
        \   },
        \   'cocConfig': {
        \      'root-uri': '~/.config/coc',
        \   },
        \   'tab': {
        \     'position': 'tab',
        \     'quit-on-open': v:true,
        \   },
        \   'floating': {
        \      'position': 'floating',
        \      'floating-position': 'center',
        \      'floating-width': 100,
        \      'open-action-strategy': 'sourceWindow',
        \      'file-child-template': '[git | 2] [selection | clip | 1]
                    \ [indent] [icon | 1] [diagnosticError & 1]
                    \ [filename omitCenter 1][modified][readonly]
                    \ [linkIcon & 1][link growRight 1] [timeCreated | 8] [size]'
        \   },
        \   'floatingTop': {
        \     'position': 'floating',
        \     'floating-position': 'center-top',
        \     'open-action-strategy': 'sourceWindow',
        \   },
        \   'floatingLeftSide': {
        \      'position': 'floating',
        \      'floating-position': 'left-center',
        \      'floating-width': 100,
        \      'open-action-strategy': 'sourceWindow',
        \   },
        \   'floatingRightSide': {
        \      'position': 'floating',
        \      'floating-position': 'right-center',
        \      'floating-width': 100,
        \      'open-action-strategy': 'sourceWindow',
        \   },
        \   'simplify': {
        \     'file-child-template': '[selection | clip | 1] [indent][icon | 1] [filename omitCenter 1]'
        \   },
        \   'buffer': {
        \     'sources': [{'name': 'buffer', 'expand': v:true}]
        \   },
    \ }
nnoremap <M-e> :CocCommand explorer --preset floating<CR>
