lua <<EOF
require'nvim-treesitter.configs'.setup {
    ensure_installed = {"c", "cpp", "rust"},
    highlight = {
        enable = true,
    },
}
EOF
