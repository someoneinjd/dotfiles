return {

  {
    "nvim-telescope/telescope.nvim",
    dependencies = {
      { "nvim-lua/plenary.nvim" },
    },
    keys = {
      { "\\ff", "<CMD>Telescope find_files<CR>" },
      { "\\fg", "<CMD>Telescope live_grep<CR>" },
      { "\\fb", "<CMD>Telescope buffers<CR>" },
    },
  },

  {
    "nvim-tree/nvim-tree.lua",
    cmd = "NvimTreeToggle",
    config = function()
      require("nvim-tree").setup({})
    end,
    keys = { { "<M-e>", "<CMD>NvimTreeToggle<CR>" } },
  },

  {
    "VonHeikemen/lsp-zero.nvim",
    branch = "v3.x",
    lazy = true,
    config = false,
    init = function()
      -- Disable automatic setup, we are doing it manually
      vim.g.lsp_zero_extend_cmp = 0
      vim.g.lsp_zero_extend_lspconfig = 0
    end,
  },

  {
    "hrsh7th/nvim-cmp",
    event = "InsertEnter",
    dependencies = {
      { "L3MON4D3/LuaSnip" },
      { "saadparwaiz1/cmp_luasnip" },
      { "hrsh7th/cmp-path" },
      { "hrsh7th/cmp-buffer" },
      { "hrsh7th/cmp-cmdline" },
      { "onsails/lspkind.nvim" },
    },
    config = function()
      require("plugins.cmp")
    end,
  },

  {
    "neovim/nvim-lspconfig",
    cmd = "LspInfo",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
      { "hrsh7th/cmp-nvim-lsp" },
    },
    config = function()
      require("plugins.lsp")
    end,
  },

  {
    "mhartington/formatter.nvim",
    cmd = "Format",
    config = function()
      require("plugins.format")
    end,
    keys = { { "<M-f>", "<CMD>Format<CR>" } },
  },

  {
    "j-hui/fidget.nvim",
    event = "LspAttach",
    config = function()
      require("fidget").setup({ text = { spinner = "dots_negative" } })
    end,
  },

  {
    "ray-x/lsp_signature.nvim",
    event = "VeryLazy",
    config = function()
      require("lsp_signature").setup({ hint_prefix = " " })
    end,
  },

  {
    "akinsho/bufferline.nvim",
    init = function()
      require("bufferline").setup({ options = { numbers = "ordinal" } })
    end,
    keys = {
      { "<M-1>", "<CMD>BufferLineGoToBuffer 1<CR>" },
      { "<M-2>", "<CMD>BufferLineGoToBuffer 2<CR>" },
      { "<M-3>", "<CMD>BufferLineGoToBuffer 3<CR>" },
      { "<M-4>", "<CMD>BufferLineGoToBuffer 4<CR>" },
      { "<M-5>", "<CMD>BufferLineGoToBuffer 5<CR>" },
      { "<M-6>", "<CMD>BufferLineGoToBuffer 6<CR>" },
      { "<M-7>", "<CMD>BufferLineGoToBuffer 7<CR>" },
      { "<M-8>", "<CMD>BufferLineGoToBuffer 8<CR>" },
      { "<M-9>", "<CMD>BufferLineGoToBuffer 9<CR>" },
      { "<M-d>", "<CMD>bdelete<CR>" },
    },
  },

  {
    "tiagovla/scope.nvim",
    init = function()
      require("scope").setup({})
    end,
    keys = {
      { "<M-n>", "<CMD>tabnext<CR>" },
      { "<M-p>", "<CMD>tabprevious<CR>" },
    },
  },

  {
    "nvim-lualine/lualine.nvim",
    config = function()
      require("plugins.eviline")
    end,
  },

  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
      require("nvim-treesitter.configs").setup({
        ensure_installed = {
          "c",
          "lua",
          "cpp",
          "rust",
          "bash",
          "cmake",
          "python",
          "markdown",
          "markdown_inline",
        },
        sync_install = true,
        highlight = {
          enable = true,
        },
      })
    end,
  },

  {
    "windwp/nvim-autopairs",
    event = "InsertEnter",
    opts = {},
  },

  {
    "folke/trouble.nvim",
    dependencies = {
      { "nvim-tree/nvim-web-devicons" },
    },
    cmd = { "Trouble", "TroubleToggle" },
    config = function()
      require("trouble").setup({})
    end,
    keys = { { "\\xx", "<CMD>TroubleToggle<CR>" } },
  },

  {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      vim.cmd("colorscheme tokyonight")
      vim.g.tokyonight_style = "storm"
      vim.g.tokyonight_italic_functions = true
      vim.o.pumblend = 20
    end,
  },

  {
    "folke/flash.nvim",
    event = "VeryLazy",
    ---@type Flash.Config
    opts = {},
        -- stylua: ignore
        keys = {
          { "s", mode = { "n", "o", "x" }, function() require("flash").jump() end, desc = "Flash" },
          { "S", mode = { "n", "o", "x" }, function() require("flash").treesitter() end, desc = "Flash Treesitter" },
          { "r", mode = "o", function() require("flash").remote() end, desc = "Remote Flash" },
          { "R", mode = { "o", "x" }, function() require("flash").treesitter_search() end, desc = "Treesitter Search" },
          { "<c-s>", mode = { "c" }, function() require("flash").toggle() end, desc = "Toggle Flash Search" },
        },
  },
}
