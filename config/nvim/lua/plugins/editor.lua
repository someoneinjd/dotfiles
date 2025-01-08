return {
  {
    "nvim-telescope/telescope-fzf-native.nvim",
    build = "make",
  },

  {
    "nvim-telescope/telescope.nvim",
    dependencies = {
      { "nvim-lua/plenary.nvim" },
    },
    config = function()
      require("telescope").load_extension("fzf")
    end,
    keys = {
      { "<leader>ff", "<CMD>Telescope find_files<CR>" },
      { "<leader>fg", "<CMD>Telescope live_grep<CR>" },
      { "<leader>fb", "<CMD>Telescope buffers<CR>" },
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
      { "<c-s>", mode = "c", function() require("flash").toggle() end, desc = "Toggle Flash Search" },
    },
  },

  {
    "nvimdev/indentmini.nvim",
    opts = {},
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
    },
    keys = {
      {
        "]c",
        mode = "n",
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
        mode = "n",
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
        mode = "n",
        function()
          require("gitsigns").stage_hunk()
        end,
      },
      {
        "<leader>hr",
        mode = "n",
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
        mode = "n",
        function()
          require("gitsigns").stage_buffer()
        end,
      },
      {
        "<leader>hR",
        mode = "n",
        function()
          require("gitsigns").reset_buffer()
        end,
      },
      {
        "<leader>hu",
        mode = "n",
        function()
          require("gitsigns").undo_stage_hunk()
        end,
      },
      {
        "<leader>hp",
        mode = "n",
        function()
          require("gitsigns").preview_hunk()
        end,
      },
      {
        "<leader>hb",
        mode = "n",
        function()
          require("gitsigns").blame_line({ full = true })
        end,
      },
      {
        "<leader>tb",
        mode = "n",
        function()
          require("gitsigns").toggle_current_line_blame()
        end,
      },
      {
        "<leader>td",
        mode = "n",
        function()
          require("gitsigns").toggle_deleted()
        end,
      },
      {
        "<leader>hd",
        mode = "n",
        function()
          require("gitsigns").diffthis()
        end,
      },
      {
        "<leader>hD",
        mode = "n",
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
      templates = { "builtin", "user.cpp" },
    },
    keys = {
      {
        "<leader>r",
        mode = "n",
        "<CMD>OverseerRun<CR>",
      },
    },
  },
}
