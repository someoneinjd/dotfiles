require 'nvim-treesitter.configs'.setup {
    ensure_installed = {'c', 'cpp', 'lua', 'rust'};
    highlight = {
        enable = true;
    };
}
