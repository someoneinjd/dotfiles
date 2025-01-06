vim.cmd("syntax on")
vim.cmd("filetype indent on")
vim.opt.termguicolors = true
vim.opt.smarttab = true
vim.opt.swapfile = false
vim.opt.showmode = false
vim.opt.showtabline = 2
vim.opt.laststatus = 3
vim.opt.backup = false
vim.opt.writebackup = false
vim.opt.clipboard = "unnamedplus"
vim.opt.fileencoding = "utf-8"
vim.opt.smartindent = true
vim.opt.autoindent = true
vim.opt.tabstop = 4
vim.opt.expandtab = true
vim.opt.shiftwidth = 4
vim.opt.cursorline = true
vim.opt.relativenumber = true
vim.opt.completeopt = "menuone,noselect"
vim.opt.pumheight = 20
vim.opt.foldmethod = "marker"
vim.opt.signcolumn = "yes"

-- set indent to 2 for lua
vim.api.nvim_create_autocmd("FileType", {
  pattern = "lua",
  callback = function()
    vim.opt_local.shiftwidth = 2
    vim.opt_local.tabstop = 2
  end,
})

-- user event that loads after UIEnter + only if file buf is there
vim.api.nvim_create_autocmd({ "UIEnter", "BufReadPost", "BufNewFile" }, {
  group = vim.api.nvim_create_augroup("MyFilePost", { clear = true }),
  callback = function(args)
    local file = vim.api.nvim_buf_get_name(args.buf)
    local buftype = vim.api.nvim_get_option_value("buftype", { buf = args.buf })

    if not vim.g.ui_entered and args.event == "UIEnter" then
      vim.g.ui_entered = true
    end

    if file ~= "" and buftype ~= "nofile" and vim.g.ui_entered then
      vim.api.nvim_exec_autocmds("User", { pattern = "FilePost", modeline = false })
      vim.api.nvim_del_augroup_by_name("MyFilePost")
      vim.schedule(function()
        vim.api.nvim_exec_autocmds("FileType", {})
      end)
    end
  end,
})

-- Copy/Paste when using ssh on a remote server
if vim.env.SSH_CONNECTION and pcall(require, "vim.ui.clipboard.osc52") then
  vim.g.clipboard = {
    name = "OSC 52",
    copy = {
      ["+"] = require("vim.ui.clipboard.osc52").copy("+"),
      ["*"] = require("vim.ui.clipboard.osc52").copy("*"),
    },
    paste = {
      ["+"] = require("vim.ui.clipboard.osc52").paste("+"),
      ["*"] = require("vim.ui.clipboard.osc52").paste("*"),
    },
  }
end
