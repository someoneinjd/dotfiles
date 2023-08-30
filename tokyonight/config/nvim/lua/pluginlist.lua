local filetypes = require "base".lsp_filetypes

return {
    "wbthomason/packer.nvim",

    "nvim-tree/nvim-web-devicons",

    "nvim-lua/plenary.nvim",

    {
        "nvim-telescope/telescope.nvim",
        init = function() require "mappings".telescope() end,
    },

    {
        "nvim-tree/nvim-tree.lua",
        cmd = "NvimTreeToggle",
        init = function() require "mappings".nvimtree() end,
        config = function() require "nvim-tree".setup {} end
    },

    {
        "neovim/nvim-lspconfig",
        -- ft = filetypes,
        config = function() require "plugins.lsp" end
    },

    {
        "nvimdev/lspsaga.nvim",
        -- ft = filetypes,
        init = function() require "mappings".lspsaga() end,
        config = function() require "lspsaga".setup { symbol_in_winbar = { enable = false } } end
    },

    {
        "mhartington/formatter.nvim",
        -- ft = filetypes,
        cmd = "Format",
        init = function() require "mappings".formatter() end,
        config = function() require "plugins.format" end
    },

    {
        "j-hui/fidget.nvim",
        -- ft = filetypes,
        config = function() require "fidget".setup {text = {spinner = "dots_negative"}} end
    },

    {
        "ray-x/lsp_signature.nvim",
        -- ft = filetypes,
        config = function() require "plugins.signature" end
    },

    {
        "akinsho/bufferline.nvim",
        init = function() require "mappings".bufferline() end,
        config = function() require "bufferline".setup {} end
    },

    {
        "hrsh7th/nvim-cmp",
        event = "InsertEnter",
        config = function() require "plugins.cmp" end
    },

    {
        "L3MON4D3/LuaSnip",
        -- ft = filetypes
    },

    {
        "saadparwaiz1/cmp_luasnip",
        -- ft = filetypes
    },

    {
        "hrsh7th/cmp-nvim-lsp",
        -- ft = filetypes
    },

    {
        "hrsh7th/cmp-path",
    },

    {
        "hrsh7th/cmp-buffer",
    },

    {
        "nvim-lualine/lualine.nvim",
        config = function() require "plugins.eviline" end
    },

    {
        "nvim-treesitter/nvim-treesitter",
        -- ft = filetypes,
        build = ":TSUpdate",
        config = function() require "plugins.treesitter" end
    },

    {
        "folke/lsp-colors.nvim",
        -- ft = filetypes,
        config = function() require "lsp-colors".setup {} end
    },

    {
        "windwp/nvim-autopairs",
        config = function() require "plugins.autopairs" end
    },

    {
        "folke/trouble.nvim",
        -- ft = filetypes,
        init = function() require "mappings".trouble() end,
        config = function() require "trouble".setup {} end
    },

    {
        "folke/tokyonight.nvim",
        config = function() require "plugins.theme" end
    },
}
