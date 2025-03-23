return {
  {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      vim.cmd("colorscheme tokyonight")
    end,
  },

  {
    "akinsho/bufferline.nvim",
    event = "VeryLazy",
    init = function()
      require("bufferline").setup({
        options = {
          numbers = "ordinal",
        },
      })
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
}
