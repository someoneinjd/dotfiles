local all_types = table.insert(require 'base'.lsp_filetypes, "markdown")

require 'nvim-treesitter.configs'.setup {
    ensure_installed = all_types,
    highlight = {
        enable = true
    }
}
