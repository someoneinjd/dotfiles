local tmpl = function(compiler, additional_args)
  if additional_args then
    return {
      name = compiler .. " build (with additional flags)",
      params = {
        args = {
          type = "list",
          subtype = { type = "string" },
          delimiter = " ",
          name = "Additional Flags",
          desc = "Additional compile flags for " .. compiler,
          default = {},
        },
      },
      builder = function(params)
        local file = vim.fn.expand("%:p")
        local exec_file = vim.fn.expand("%:p:r")
        return {
          cmd = { compiler },
          args = vim.list_extend({ file, "-o", exec_file }, params.args),
          components = { "open_output", "default" },
        }
      end,
    }
  else
    return {
      name = compiler .. " build",
      builder = function()
        local file = vim.fn.expand("%:p")
        local exec_file = vim.fn.expand("%:p:r")
        return {
          cmd = { compiler },
          args = { file, "-o", exec_file },
          components = { "open_output", "default" },
        }
      end,
    }
  end
end

return {
  cached_key = function(opts)
    return vim.fn.expand("%:p")
  end,

  condition = {
    filetype = { "c", "cpp" },
    callback = function(search)
      if vim.fn.executable("g++") == 0 and vim.fn.executable("clang++") == 0 then
        return false, "No compiler available: g++ or clang++"
      else
        return true
      end
    end,
  },

  generator = function(search, cb)
    cb(vim
      .iter({ "g++", "clang++" })
      :map(function(compiler)
        return { tmpl(compiler, true), tmpl(compiler, false) }
      end)
      :flatten()
      :totable())
  end,
}
