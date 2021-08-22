local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }
local M = {}

M.base = function()
    map('n', '<M-d>', '<CMD>bwipe<CR>', opts)
end

M.lspsaga = function()
    map('n', '<M-t>', '<CMD>lua require "lspsaga.floaterm".open_float_terminal()<CR>', opts)
    map('n', 'gh', '<CMD>Lspsaga lsp_finder<CR>', opts)
    map('n', 'ga', '<CMD>Lspsaga code_action<CR>', opts)
    map('n', 'K', '<CMD>Lspsaga hover_doc<CR>', opts)
    map('n', 'gr', '<CMD>Lspsaga rename<CR>', opts)
    map('t', '<M-d>', '<C-\\><C-n><CMD>lua require "lspsaga.floaterm".close_float_terminal()<CR>', opts)
end

M.bufferline = function()
    map('n', '<M-p>', '<CMD>BufferLineCyclePrev<CR>', opts)
    map('n', '<M-n>', '<CMD>BufferLineCycleNext<CR>', opts)
end

M.nvimtree = function()
    map('n', '<M-e>', '<CMD>NvimTreeToggle<CR>', opts)
end

M.trouble = function()
    map('n', '<LEADER>xx', '<CMD>TroubleToggle<CR>', opts)
end

M.telescope = function()
    map('n', '<LEADER>ff', '<CMD>Telescope find_file<CR>', opts)
    map('n', '<LEADER>fg', '<CMD>Telescope live_grep<CR>', opts)
    map('n', '<LEADER>fb', '<CMD>Telescope buffers<CR>', opts)
end

M.formatter = function()
    map('n', '<M-f>', '<CMD>Format<CR>', opts)
end

return M
