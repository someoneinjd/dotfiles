local cmp = require 'cmp'
local icons = require 'plugins.icons'

local t = function(str)
  return vim.api.nvim_replace_termcodes(str, true, true, true)
end

local check_back_space = function()
  local col = vim.fn.col '.' - 1
  return col == 0 or vim.fn.getline('.'):sub(col, col):match '%s' ~= nil
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
    mapping = {
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
        ['<Tab>'] = function(fallback)
            if cmp.visible() then
                cmp.select_next_item()
            elseif require 'luasnip'.expand_or_jumpable() then
                vim.fn.feedkeys(t('<Plug>luasnip-expand-or-jump'), '')
            else
                fallback()
            end
        end,
        ['<S-Tab>'] = function(fallback)
            if cmp.visible() then
                cmp.select_prev_item()
            elseif require 'luasnip'.jumpable(-1) then
                vim.fn.feedkeys(t('<Plug>luasnip-jump-prev'), '')
            else
                fallback()
            end
        end
    },
    sources = {
        { name = 'nvim_lsp' },
        { name = 'luasnip' },
        { name = 'buffer' },
        { name = 'path'}
    }
}
