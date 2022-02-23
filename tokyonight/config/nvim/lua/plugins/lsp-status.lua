local lsp_status = require('lsp-status')
lsp_status.config {
    indicator_hint = ' ',
    indicator_info = ' ',
    status_symbol = ''
}
lsp_status.register_progress()

local lspconfig = require('lspconfig')
local sumneko_root_path = '/usr/share/lua-language-server'
local runtime_path = vim.split(package.path, ';')
table.insert(runtime_path, 'lua/?.lua')
table.insert(runtime_path, 'lua/?/init.lua')

local capabilities = lsp_status.capabilities
capabilities.textDocument.completion.completionItem.snippetSupport = true
capabilities.textDocument.completion.completionItem.resolveSupport = {
    properties = {
        'documentation',
        'detail',
        'additionalTextEdits',
    }
}


lspconfig.clangd.setup {
    handlers = lsp_status.extensions.clangd.setup(),
    init_options = {
        clangdFileStatus = true
    },
    on_attach = lsp_status.on_attach,
    capabilities = capabilities
}

lspconfig.rust_analyzer.setup {
    on_attach = lsp_status.on_attach,
    capabilities = capabilities
}

lspconfig.pyright.setup {
    on_attach = lsp_status.on_attach,
    capabilities = capabilities
}
