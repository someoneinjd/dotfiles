return {
  {
    "saghen/blink.cmp",
    build = "cargo build --release",
    opts = {
      keymap = {
        preset = "enter",
        ["<Tab>"] = {
          "select_next",
          "snippet_forward",
          "fallback",
        },
        ["<S-Tab>"] = {
          "select_prev",
          "snippet_backward",
          "fallback",
        },
        cmdline = {
          preset = "default",
          ["<Tab>"] = { "select_next", "fallback" },
          ["<S-Tab>"] = { "select_prev", "fallback" },
        },
      },
      appearance = {
        use_nvim_cmp_as_default = true,
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

      for _, val in ipairs({ "rust_analyzer", "clangd", "pyright" }) do
        require("lspconfig")[val].setup({
          on_attach = function(client, bufnr)
            if client.server_capabilities.inlayHintProvider then
              vim.lsp.inlay_hint.enable(true)
            end
            local opts = { buffer = bufnr }

            vim.keymap.set("n", "K", "<CMD>lua vim.lsp.buf.hover()<CR>", opts)
            vim.keymap.set("n", "gd", "<CMD>lua vim.lsp.buf.definition()<CR>", opts)
            vim.keymap.set("n", "gi", "<CMD>lua vim.lsp.buf.implementation()<CR>", opts)
            vim.keymap.set("n", "gr", "<CMD>lua vim.lsp.buf.references()<CR>", opts)
            vim.keymap.set("n", "ga", "<CMD>lua vim.lsp.buf.code_action()<CR>", opts)
            vim.keymap.set("n", "[d", "<CMD>lua vim.diagnostic.goto_next()<CR>", opts)
            vim.keymap.set("n", "]d", "<CMD>lua vim.diagnostic.goto_prev()<CR>", opts)
            vim.keymap.set("n", "<M-r>", "<CMD>lua vim.lsp.buf.rename()<CR>", opts)
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
            require("formatter.filetypes.python").black,
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
    config = function()
      require("trouble").setup({})
    end,
    -- stylua: ignore
    keys = {
      { "<localleader>xx", "<CMD>Trouble diagnostics toggle<CR>" },
      { "<localleader>o", "<CMD>Trouble symbols toggle<CR>" }
    },
  },

  {
    "smjonas/inc-rename.nvim",
    cmd = "IncRename",
    config = function()
      require("inc_rename").setup({ input_buffer_type = "dressing" })
    end,
    -- stylua: ignore
    keys = {
      { "<M-r>", function() return ":IncRename " .. vim.fn.expand("<cword>") end, expr = true },
    },
  },
}
