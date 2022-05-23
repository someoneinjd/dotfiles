local cmp = require 'cmp'
local icons = require 'plugins.icons'

local has_words_before = function()
  local line, col = unpack(vim.api.nvim_win_get_cursor(0))
  return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
end

cmp.setup {
    snippet = {
        expand = function(args)
            require 'luasnip'.lsp_expand(args.body)
        end
    },
    formatting = {
        format = function(entry, vim_item)
            -- load lspkind icons
            vim_item.kind = icons[vim_item.kind]

            vim_item.menu = ({
                nvim_lsp = '[LSP]',
                buffer = '[BUF]'
            })[entry.source.name]
            return vim_item
        end,
    },
    mapping = cmp.mapping.preset.insert {
        ['<C-p>'] = cmp.mapping.select_prev_item(),
        ['<C-n>'] = cmp.mapping.select_next_item(),
        ['<C-d>'] = cmp.mapping.scroll_docs(-4),
        ['<C-f>'] = cmp.mapping.scroll_docs(4),
        ['<C-Space>'] = cmp.mapping.complete(),
        ['<C-e>'] = cmp.mapping.close(),
        ['<CR>'] = cmp.mapping.confirm {
            behavior = cmp.ConfirmBehavior.Replace,
            select = true
        },
        ['<Tab>'] = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.select_next_item()
            elseif require 'luasnip'.expand_or_jumpable() then
                require 'luasnip'.expand_or_jump()
            elseif has_words_before() then
                cmp.complete()
            else
                fallback()
            end
        end, {'i', 's'}),
        ['<S-Tab>'] = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.select_next_item()
            elseif require 'luasnip'.jumpable(-1) then
                require 'luasnip'.jump(-1)
            else
                fallback()
            end
        end, {'i', 's'})
    },
    sources = cmp.config.sources {
        { name = 'nvim_lsp'},
        { name = 'path'},
        { name = 'luasnip' },
        { name = 'buffer' }
    }
}
