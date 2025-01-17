vim.keymap.set("n", "<ESC>", "<CMD>nohlsearch<CR>")
vim.keymap.set("n", "]d", "<CMD>lua vim.diagnostic.goto_next()<CR>")
vim.keymap.set("n", "[d", "<CMD>lua vim.diagnostic.goto_prev()<CR>")
