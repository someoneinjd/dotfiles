require 'formatter'.setup {
    logging = false,
    filetype = {
        rust = {
            -- Rustfmt
            function()
                return {
                    exe = "rustfmt",
                    args = {"--emit=stdout"},
                    stdin = true
                }
            end
        },
        lua = {
            -- luafmt
            function()
                return {
                    exe = "luafmt",
                    args = {"--indent-count", 2, "--stdin"},
                    stdin = true
                }
            end
        },
        cpp = {
            -- clang-format
            function()
                return {
                exe = "clang-format",
                args = {},
                stdin = true,
                cwd = vim.fn.expand('%:p:h')  -- Run clang-format in cwd of the file.
            }
            end
        },
        c = {
            -- clang-format
            function()
                return {
                exe = "clang-format",
                args = {},
                stdin = true,
                cwd = vim.fn.expand('%:p:h')  -- Run clang-format in cwd of the file.
            }
            end
        },
        python = {
            -- black
            function()
                return {
                    exe = "black",
                    args = { '-' },
                    stdin = true,
                }
            end
        }
    }
}
