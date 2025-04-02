vim.keymap.set("n", "<ESC>", "<CMD>nohlsearch<CR>")
vim.keymap.set("n", "]d", "<CMD>lua vim.diagnostic.jump({count=1, float=true})<CR>")
vim.keymap.set("n", "[d", "<CMD>lua vim.diagnostic.jump({count=-1, float=true})<CR>")
