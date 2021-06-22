return require('packer').startup(function()
    use 'wbthomason/packer.nvim'
    use {
        'neovim/nvim-lspconfig',
        opt = true,
        ft = {'c', 'cpp', 'rust', 'lua'}
    }
    use {'glenir/lspsaga.nvim'}
    use {'nvim-lua/popup.nvim'}
    use {'nvim-lua/plenary.nvim'}
    use {'nvim-telescope/telescope.nvim'}
    use {'hrsh7th/nvim-compe'}
    use {'nvim-treesitter/nvim-treesitter', run = ':TSUpdate'}
    use {'romgrk/barbar.nvim'}
    use {'glepnir/galaxyline.nvim', branch = 'main'}
    use {'kyazdani42/nvim-web-devicons'}
    use {
        'folke/lsp-colors.nvim',
        opt = true,
        ft = {'c', 'cpp', 'rust', 'lua'}
    }
    use {'numToStr/FTerm.nvim'}
    use {'windwp/nvim-autopairs'}
    use {'kyazdani42/nvim-tree.lua'}
    use {
        'folke/trouble.nvim',
        opt = true,
        ft = {'c', 'cpp', 'rust', 'lua'}
    }
    use {'dracula/vim', as = 'dracula'}
end)
