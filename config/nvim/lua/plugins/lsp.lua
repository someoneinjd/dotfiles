return {
  {
    "saghen/blink.cmp",
    build = "cargo build --release",
    event = { "InsertEnter", "CmdlineEnter" },
    opts = {
      keymap = {
        preset = "enter",
        ["<Tab>"] = {
          function(cmp)
            if cmp.is_visible() then
              return cmp.select_next()
            elseif cmp.snippet_active() then
              return cmp.snippet_forward()
            else
              return false
            end
          end,
          "fallback",
        },
        ["<S-Tab>"] = {
          function(cmp)
            if cmp.is_visible() then
              return cmp.select_prev()
            elseif cmp.snippet_active() then
              return cmp.snippet_backward()
            else
              return false
            end
          end,
          "fallback",
        },
      },
      cmdline = {
        keymap = {
          preset = "default",
          ["<Tab>"] = { "select_next", "fallback" },
          ["<S-Tab>"] = { "select_prev", "fallback" },
        },
        completion = {
          list = {
            selection = {
              preselect = false,
              auto_insert = true,
            },
          },
          menu = { auto_show = true },
        },
      },
      appearance = {
        use_nvim_cmp_as_default = false,
        nerd_font_variant = "mono",
      },
      sources = {
        default = { "lsp", "path", "buffer" },
      },
      signature = { enabled = true },
      completion = {
        documentation = {
          auto_show = true,
          auto_show_delay_ms = 200,
        },
        list = {
          selection = {
            preselect = true,
            auto_insert = false,
          },
        },
        menu = {
          draw = {
            columns = {
              { "label", "label_description", gap = 1 },
              { "kind_icon" },
            },
          },
        },
      },
    },
    opts_extend = { "sources.default" },
  },

  {
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = { "saghen/blink.cmp" },
    config = function()
      vim.lsp.enable({ "rust_analyzer", "clangd", "pyright", "ruff" })
    end,
  },

  {
    "stevearc/conform.nvim",
    cmd = "ConformInfo",
    opts = {
      formatters_by_ft = {
        c = { "clang-format" },
        cpp = { "clang-format" },
        lua = { "stylua" },
        python = { "ruff_format" },
        rust = { "rustfmt", lsp_format = "fallback" },
        ["*"] = { "trim_whitespace" },
      },
    },
    keys = {
      {
        "<M-f>",
        function()
          require("conform").format()
        end,
        mode = { "n", "v" },
      },
    },
  },

  {
    "folke/trouble.nvim",
    dependencies = {
      { "nvim-tree/nvim-web-devicons" },
    },
    cmd = { "Trouble", "TroubleToggle" },
    opts = {},
    keys = {
      { "gr", "<CMD>Trouble lsp_references toggle<CR>" },
      { "gd", "<CMD>Trouble lsp_definitions toggle<CR>" },
      { "gi", "<CMD>Trouble lsp_implementations toggle<CR>" },
      { "<leader>xx", "<CMD>Trouble diagnostics toggle<CR>" },
      { "<leader>o", "<CMD>Trouble symbols toggle win.position=right<CR>" },
    },
  },

  {
    "saecki/live-rename.nvim",
    opts = {},
    keys = {
      {
        "<M-r>",
        function()
          require("live-rename").rename({ insert = true })
        end,
      },
    },
  },
}
