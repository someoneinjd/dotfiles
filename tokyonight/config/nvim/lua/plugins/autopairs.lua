require 'nvim-autopairs'.setup()
require 'nvim-autopairs.completion.cmp'.setup {
    map_cr = true,
    map_complete = true,  -- insert () func completion
    auto_select = true -- automatically select the first item
}
