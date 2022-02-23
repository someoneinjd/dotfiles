vim.cmd 'syntax on'
vim.cmd 'filetype indent on'
vim.o.termguicolors = true
vim.o.smarttab = true
vim.o.swapfile = false
vim.o.showmode = false
vim.o.showtabline = 2
vim.o.backup = false
vim.o.writebackup = false
vim.o.clipboard = 'unnamedplus'
vim.o.fileencoding = 'utf-8'
vim.o.smartindent = true
vim.o.autoindent = true
vim.o.tabstop = 4
vim.o.expandtab = true
vim.o.shiftwidth = 4
vim.o.cursorline = true
vim.o.relativenumber = true
vim.o.completeopt = "menuone,noselect"
vim.o.pumheight = 20

return {
    lsp_filetypes = {'c', 'cpp', 'rust', 'python'}
}
