return {
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
    "stevearc/dressing.nvim",
    opts = {
      input = {
        override = function(conf)
          conf.col = -1
          conf.row = 0
          return conf
        end,
      },
    },
  },
}
