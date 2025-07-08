return {
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
      { "<c-s>", mode = "c", function() require("flash").toggle() end, desc = "Toggle Flash Search" },
    },
  },

  {
    "kylechui/nvim-surround",
    event = "VeryLazy",
    opts = {},
  },

  {
    "lewis6991/gitsigns.nvim",
    event = "User FilePost",
    opts = {
      signs = {
        add = { text = "┃" },
        change = { text = "┃" },
        delete = { text = "_" },
        topdelete = { text = "‾" },
        changedelete = { text = "~" },
        untracked = { text = "┃" },
      },
      current_line_blame = true,
    },
    keys = {
      {
        "]c",
        function()
          if vim.wo.diff then
            vim.cmd.normal({ "]c", bang = true })
          else
            require("gitsigns").nav_hunk("next")
          end
        end,
      },
      {
        "[c",
        function()
          if vim.wo.diff then
            vim.cmd.normal({ "[c", bang = true })
          else
            require("gitsigns").nav_hunk("prev")
          end
        end,
      },
      {
        "<leader>hs",
        function()
          require("gitsigns").stage_hunk()
        end,
      },
      {
        "<leader>hr",
        function()
          require("gitsigns").reset_hunk()
        end,
      },
      {
        "<leader>hs",
        mode = "v",
        function()
          require("gitsigns").stage_hunk({ vim.fn.line("."), vim.fn.line("v") })
        end,
      },
      {
        "<leader>hr",
        mode = "v",
        function()
          require("gitsigns").reset_hunk({ vim.fn.line("."), vim.fn.line("v") })
        end,
      },
      {
        "<leader>hS",
        function()
          require("gitsigns").stage_buffer()
        end,
      },
      {
        "<leader>hR",
        function()
          require("gitsigns").reset_buffer()
        end,
      },
      {
        "<leader>hu",
        function()
          require("gitsigns").undo_stage_hunk()
        end,
      },
      {
        "<leader>hp",
        function()
          require("gitsigns").preview_hunk()
        end,
      },
      {
        "<leader>hb",
        function()
          require("gitsigns").blame_line({ full = true })
        end,
      },
      {
        "<leader>tb",
        function()
          require("gitsigns").toggle_current_line_blame()
        end,
      },
      {
        "<leader>td",
        function()
          require("gitsigns").toggle_deleted()
        end,
      },
      {
        "<leader>hd",
        function()
          require("gitsigns").diffthis()
        end,
      },
      {
        "<leader>hD",
        function()
          require("gitsigns").diffthis("~")
        end,
      },
    },
  },

  {
    "catgoose/nvim-colorizer.lua",
    event = "User FilePost",
    opts = {},
  },

  {
    "stevearc/overseer.nvim",
    opts = {
      templates = { "builtin", "user.cpp", "user.python" },
    },
    keys = {
      { "<leader>r", "<CMD>OverseerRun<CR>" },
    },
  },

  {
    "kevinhwang91/nvim-hlslens",
    opts = {
      nearest_only = true,
    },
    keys = {
      { "n", "<CMD>execute('normal! ' . v:count1 . 'n')<CR><CMD>lua require('hlslens').start()<CR>" },
      { "N", "<CMD>execute('normal! ' . v:count1 . 'N')<CR><CMD>lua require('hlslens').start()<CR>" },
      { "*", "*<CMD>lua require('hlslens').start()<CR>" },
      { "#", "#<CMD>lua require('hlslens').start()<CR>" },
      { "g*", "g*<CMD>lua require('hlslens').start()<CR>" },
      { "g#", "g#<CMD>lua require('hlslens').start()<CR>" },
    },
  },
  {
    "MeanderingProgrammer/render-markdown.nvim",
    dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-tree/nvim-web-devicons' },
    ft = "markdown",
    opts = {},
  },
}
