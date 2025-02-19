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
