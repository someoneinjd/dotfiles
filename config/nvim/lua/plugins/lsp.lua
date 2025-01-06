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
        cmdline = {
          preset = "default",
          ["<Tab>"] = { "select_next", "fallback" },
          ["<S-Tab>"] = { "select_prev", "fallback" },
        },
      },
      appearance = {
        use_nvim_cmp_as_default = false,
        nerd_font_variant = "mono",
      },
      sources = {
        default = { "lsp", "path", "buffer" },
      },
      signature = { enabled = true, window = { border = "rounded" } },
      completion = {
        documentation = {
          auto_show = true,
          auto_show_delay_ms = 200,
          window = { border = "rounded" },
        },
        list = {
          selection = function(ctx)
            return ctx.mode == "cmdline" and "auto_insert" or "preselect"
          end,
        },
        menu = {
          border = "rounded",
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
      vim.diagnostic.config({
        virtual_text = {
          prefix = "●", -- Could be '●', '▎', 'x', ■
          spacing = 4,
        },
        float = { border = "rounded" },
        signs = {
          text = {
            [vim.diagnostic.severity.ERROR] = "󰅚 ",
            [vim.diagnostic.severity.WARN] = " ",
            [vim.diagnostic.severity.INFO] = " ",
            [vim.diagnostic.severity.HINT] = "",
          },
        },
      })

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
            vim.keymap.set("n", "]d", "<CMD>lua vim.diagnostic.goto_next()<CR>", opts)
            vim.keymap.set("n", "[d", "<CMD>lua vim.diagnostic.goto_prev()<CR>", opts)
          end,
          capabilities = require("blink.cmp").get_lsp_capabilities(),
        })
      end
    end,
  },

  {
    "mhartington/formatter.nvim",
    cmd = "Format",
    config = function()
      require("formatter").setup({
        logging = false,
        filetype = {
          rust = {
            require("formatter.filetypes.rust").rustfmt,
          },
          lua = {
            require("formatter.filetypes.lua").stylua,
          },
          cpp = {
            require("formatter.filetypes.cpp").clangformat,
          },
          c = {
            require("formatter.filetypes.c").clangformat,
          },
          python = {
            require("formatter.filetypes.python").ruff,
          },
          ["*"] = {
            -- "formatter.filetypes.any" defines default configurations for any
            -- filetype
            require("formatter.filetypes.any").remove_trailing_whitespace,
          },
        },
      })
    end,
    keys = { { "<M-f>", "<CMD>Format<CR>" } },
  },

  {
    "j-hui/fidget.nvim",
    event = "LspAttach",
    opts = {},
  },

  {
    "folke/trouble.nvim",
    dependencies = {
      { "nvim-tree/nvim-web-devicons" },
    },
    cmd = { "Trouble", "TroubleToggle" },
    opts = {},
    -- stylua: ignore
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
