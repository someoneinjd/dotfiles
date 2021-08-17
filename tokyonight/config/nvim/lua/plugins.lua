return require('packer').startup(function(use)
    use {'wbthomason/packer.nvim'}
    use {'neovim/nvim-lspconfig'}
    use {'glepnir/lspsaga.nvim'}
    use {'nvim-lua/popup.nvim'}
    use {'nvim-lua/plenary.nvim'}
    use {'nvim-telescope/telescope.nvim'}
    use {'nvim-lua/lsp_extensions.nvim'}
    use {'mhartington/formatter.nvim'}
    use {'L3MON4D3/Luasnip'}
    use {'kyazdani42/nvim-tree.lua'}
    use {'nvim-lua/lsp-status.nvim'}
    use {
        'ray-x/lsp_signature.nvim',
        config = function ()  require 'lsp_signature'.on_attach({hint_prefix = ' '}) end,
        ft = {'c', 'cpp', 'rust', 'lua'}
    }
    use {
        'akinsho/nvim-bufferline.lua',
        config = function () require 'bufferline'.setup {} end
    }
    use {'hrsh7th/nvim-compe'}
    use {'glepnir/galaxyline.nvim'}
    use {'nvim-treesitter/nvim-treesitter', run = ':TSUpdate'}
    use {'kyazdani42/nvim-web-devicons'}
    use {
        'folke/lsp-colors.nvim',
        config = function() require 'lsp-colors'.setup {} end,
        ft = {'c', 'cpp', 'rust', 'lua'}
    }
    use {
        'numToStr/FTerm.nvim',
        config = function() require 'FTerm'.setup {} end,
    }
    use {
        'windwp/nvim-autopairs',
        event = 'InsertEnter',
        after = 'nvim-compe',
        config = function ()
            require 'nvim-autopairs'.setup()
            require 'nvim-autopairs.completion.compe'.setup {
                map_cr = true,
                map_complete = true
            }
        end
    }
    use {
        'folke/trouble.nvim',
        config = function() require 'trouble'.setup {} end,
        ft = {'c', 'cpp', 'rust', 'lua'}
    }
    use {'folke/tokyonight.nvim'}
end)
