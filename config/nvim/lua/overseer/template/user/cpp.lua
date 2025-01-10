local tmpl = function(compiler)
  return {
    {
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
          cwd = vim.fn.expand("%:p:h"),
          components = { "open_output", "default" },
        }
      end,
    },
    {
      name = compiler .. " build",
      builder = function()
        local file = vim.fn.expand("%:p")
        local exec_file = vim.fn.expand("%:p:r")
        return {
          cmd = { compiler },
          args = { file, "-o", exec_file },
          cwd = vim.fn.expand("%:p:h"),
          components = { "open_output", "default" },
        }
      end,
    },
    {
      name = compiler .. " run (with additional flags)",
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
          cwd = vim.fn.expand("%:p:h"),
          components = { "open_output", "default", { "run_after", task_names = { { cmd = exec_file } } } },
        }
      end,
    },
    {
      name = compiler .. " run",
      builder = function()
        local file = vim.fn.expand("%:p")
        local exec_file = vim.fn.expand("%:p:r")
        return {
          cmd = { compiler },
          args = { file, "-o", exec_file },
          cwd = vim.fn.expand("%:p:h"),
          components = { "open_output", "default", { "run_after", task_names = { { cmd = exec_file } } } },
        }
      end,
    },
  }
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
    cb(vim.iter({ "g++", "clang++" }):map(tmpl):flatten():totable())
  end,
}
