local term = require("FTerm.terminal")

local ranger = term:new():setup {
    cmd = "ranger",
    dimensions = {
        height = 0.9,
        width = 0.9
    }
}

function _G.__fterm_ranger()
    ranger:toggle()
end
