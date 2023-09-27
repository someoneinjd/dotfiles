local lsp_zero = require("lsp-zero")
lsp_zero.extend_lspconfig()

lsp_zero.on_attach(function(client, bufnr)
  lsp_zero.default_keymaps({ buffer = bufnr })
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
