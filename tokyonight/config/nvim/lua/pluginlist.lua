local filetypes = require 'base'.lsp_filetypes

return require 'packer'.startup(function(use)
    use {'wbthomason/packer.nvim'}

    use {'kyazdani42/nvim-web-devicons'}

    use {
        'nvim-lua/plenary.nvim',
        after = 'bufferline.nvim'
    }

    use {
        'nvim-telescope/telescope.nvim',
        setup = function() require 'mappings'.telescope() end,
        after = 'plenary.nvim'
    }

    use {
        'kyazdani42/nvim-tree.lua',
        cmd = 'NvimTreeToggle',
        setup = function() require 'mappings'.nvimtree() end,
        config = function() require 'nvim-tree'.setup {} end
    }

    use {
        'neovim/nvim-lspconfig',
        ft = filetypes,
        config = function() require 'plugins.lsp' end
    }

    use {
        'glepnir/lspsaga.nvim',
        after = 'nvim-lspconfig',
        setup = function() require 'mappings'.lspsaga() end,
        config = function() require 'lspsaga'.setup { symbol_in_winbar = { enable = false } } end
    }

    use {
        'mhartington/formatter.nvim',
        ft = filetypes,
        cmd = 'Format',
        setup = function() require 'mappings'.formatter() end,
        config = function() require 'plugins.format' end
    }

    use {
        'j-hui/fidget.nvim',
        after = 'nvim-lspconfig',
        config = function() require 'fidget'.setup {text = {spinner = 'dots_negative'}} end
    }

    use {
        'ray-x/lsp_signature.nvim',
        after = 'lspsaga.nvim',
        config = function() require 'plugins.signature' end
    }

    use {
        'akinsho/bufferline.nvim',
        setup = function() require 'mappings'.bufferline() end,
        config = function() require 'bufferline'.setup {} end
    }

    use {
        'hrsh7th/nvim-cmp',
        event = 'InsertEnter',
        config = function() require 'plugins.cmp' end
    }

    use {
        'L3MON4D3/LuaSnip',
        after = 'nvim-cmp'
    }

    use {
        'saadparwaiz1/cmp_luasnip',
        after = 'LuaSnip'
    }

    use {
        'hrsh7th/cmp-nvim-lsp',
        after = 'cmp_luasnip'
    }

    use {
        'hrsh7th/cmp-path',
        after = 'cmp-nvim-lsp'
    }

    use {
        'hrsh7th/cmp-buffer',
        after = 'cmp-path'
    }

    use {
        'nvim-lualine/lualine.nvim',
        config = function() require 'plugins.eviline' end
    }

    use {
        'nvim-treesitter/nvim-treesitter',
        ft = filetypes,
        run = ':TSUpdate',
        event = 'BufRead',
        config = function() require 'plugins.treesitter' end
    }

    use {
        'folke/lsp-colors.nvim',
        after = 'nvim-lspconfig',
        config = function() require 'lsp-colors'.setup {} end
    }

    use {
        'windwp/nvim-autopairs',
        after = 'nvim-cmp',
        config = function() require 'plugins.autopairs' end
    }

    use {
        'folke/trouble.nvim',
        after = 'nvim-lspconfig',
        setup = function() require 'mappings'.trouble() end,
        config = function() require 'trouble'.setup {} end
    }

    use {
        'folke/tokyonight.nvim',
        config = function() require 'plugins.theme' end
    }
end)
