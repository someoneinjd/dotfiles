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
    opts = {},
    keys = { { "<M-e>", "<CMD>NvimTreeToggle<CR>" } },
  },

  {
    "windwp/nvim-autopairs",
    event = "InsertEnter",
    opts = {},
  },

  {
    "folke/flash.nvim",
    event = "VeryLazy",
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

  {
    "nvimdev/indentmini.nvim",
    opts = {}
  },
}
