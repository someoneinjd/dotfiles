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
      for _, val in ipairs({ "rust_analyzer", "clangd", "pyright", "ruff" }) do
        require("lspconfig")[val].setup({
          on_attach = function(client, bufnr)
            if client.server_capabilities.inlayHintProvider then
              vim.lsp.inlay_hint.enable(true)
            end
            local opts = { buffer = bufnr }

            vim.keymap.set("n", "K", "<CMD>lua vim.lsp.buf.hover()<CR>", opts)
            vim.keymap.set("n", "gd", "<CMD>lua vim.lsp.buf.definition()<CR>", opts)
            vim.keymap.set("n", "gi", "<CMD>lua vim.lsp.buf.implementation()<CR>", opts)
            vim.keymap.set("n", "ga", "<CMD>lua vim.lsp.buf.code_action()<CR>", opts)
          end,
          capabilities = require("blink.cmp").get_lsp_capabilities(),
        })
      end
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
