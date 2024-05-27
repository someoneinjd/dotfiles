vim.cmd("syntax on")
vim.cmd("filetype indent on")
vim.o.termguicolors = true
vim.o.smarttab = true
vim.o.swapfile = false
vim.o.showmode = false
vim.o.showtabline = 2
vim.o.laststatus = 3
vim.o.backup = false
vim.o.writebackup = false
vim.o.clipboard = "unnamedplus"
vim.o.fileencoding = "utf-8"
vim.o.smartindent = true
vim.o.autoindent = true
vim.o.tabstop = 4
vim.o.expandtab = true
vim.o.shiftwidth = 4
vim.o.cursorline = true
vim.o.relativenumber = true
vim.o.completeopt = "menuone,noselect"
vim.o.pumheight = 20

-- set indent to 2 for lua
vim.api.nvim_create_autocmd("FileType", {
  pattern = "lua",
  callback = function()
    vim.opt_local.shiftwidth = 2
    vim.opt_local.tabstop = 2
  end,
})

-- replace quickfix mean with trouble
vim.api.nvim_create_autocmd("BufWinEnter", {
  pattern = "quickfix",
  callback = function()
    local ok, trouble = pcall(require, "trouble")
    if ok then
      vim.defer_fn(function()
        vim.cmd.cclose()
        trouble.open([[quickfix]])
      end, 0)
    end
  end,
})

-- Copy/Paste when using ssh on a remote server
if vim.clipboard and vim.clipboard.osc52 then
  vim.api.nvim_create_autocmd("VimEnter", {
    group = augroup("ssh_clipboard"),
    callback = function()
      if vim.env.SSH_CONNECTION and vim.clipboard.osc52 then
        vim.g.clipboard = {
          name = "OSC 52",
          copy = {
            ["+"] = require("vim.clipboard.osc52").copy,
            ["*"] = require("vim.clipboard.osc52").copy,
          },
          paste = {
            ["+"] = require("vim.clipboard.osc52").paste,
            ["*"] = require("vim.clipboard.osc52").paste,
          },
        }
      end
    end,
  })
end
