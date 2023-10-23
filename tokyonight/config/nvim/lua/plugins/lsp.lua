return {
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
      local lsp_zero = require("lsp-zero")
      lsp_zero.extend_cmp()

      local cmp = require("cmp")
      local luasnip = require("luasnip")
      local cmp_action = lsp_zero.cmp_action()

      local has_words_before = function()
        local line, col = unpack(vim.api.nvim_win_get_cursor(0))
        return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
      end

      cmp.setup({
        formatting = {
          fields = { "abbr", "kind", "menu" },
          format = require("lspkind").cmp_format({
            mode = "symbol", -- show only symbol annotations
            maxwidth = 50, -- prevent the popup from showing more than provided characters
            ellipsis_char = "...", -- when popup menu exceed maxwidth, the truncated part would show ellipsis_char instead
          }),
        },
        mapping = cmp.mapping.preset.insert({
          ["<Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.select_next_item()
            elseif luasnip.expand_or_jumpable() then
              luasnip.expand_or_jump()
            elseif has_words_before() then
              cmp.complete()
            else
              fallback()
            end
          end, { "i", "s" }),

          ["<S-Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.select_prev_item()
            elseif luasnip.jumpable(-1) then
              luasnip.jump(-1)
            else
              fallback()
            end
          end, { "i", "s" }),

          ["<CR>"] = cmp.mapping.confirm({ select = true }),
          ["<C-u>"] = cmp.mapping.scroll_docs(-4),
          ["<C-d>"] = cmp.mapping.scroll_docs(4),
        }),
        sources = cmp.config.sources({
          { name = "nvim_lsp" },
          { name = "luasnip" },
        }, {
          { name = "buffer" },
          { name = "path" },
        }),
      })

      cmp.setup.cmdline({ "/", "?" }, {
        mapping = cmp.mapping.preset.cmdline(),
        sources = {
          { name = "buffer" },
        },
      })
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
      local lsp_zero = require("lsp-zero")
      lsp_zero.extend_lspconfig()

      lsp_zero.on_attach(function(client, bufnr)
        lsp_zero.default_keymaps({ buffer = bufnr, exclude = { "<F4>", "<F2>", "gd", "gi", "gr" } })
        vim.keymap.set("n", "ga", vim.lsp.buf.code_action, { buffer = bufnr })
      end)

      lsp_zero.set_sign_icons({
        error = "󰅚 ",
        warn = " ",
        hint = "󰌶 ",
        info = " ",
      })

      vim.diagnostic.config({
        virtual_text = {
          prefix = "●", -- Could be '●', '▎', 'x', ■
          spacing = 4,
        },
      })

      for _, val in ipairs({ "rust_analyzer", "clangd", "pyright" }) do
        require("lspconfig")[val].setup({
          on_attach = function(client, bufnr)
            if client.server_capabilities.inlayHintProvider then
              vim.lsp.inlay_hint(bufnr, true)
            end
          end,
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
    config = function()
      require("fidget").setup({ text = { spinner = "dots_negative" } })
    end,
  },

  {
    "ray-x/lsp_signature.nvim",
    event = "LspAttach",
    opts = { hint_prefix = " " },
    config = function(_, opts)
      local lsp_zero = require("lsp-zero")
      lsp_zero.on_attach(function(_, bufnr)
        require("lsp_signature").on_attach(opts, bufnr)
      end)
    end,
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
      { "\\xx", function() require("trouble").toggle() end },
      { "gd", function() require("trouble").open("lsp_definitions") end },
      { "gi", function() require("trouble").open("lsp_implementations") end },
      { "gr", function() require("trouble").open("lsp_references") end },
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
