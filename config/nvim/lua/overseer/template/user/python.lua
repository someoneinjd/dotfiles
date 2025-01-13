return {
  name = "python run",
  builder = function()
    return {
      cmd = { "python3" },
      args = { vim.fn.expand("%:p") },
      cwd = vim.fn.expand("%:p:h"),
      components = { "open_output", "default" },
    }
  end,
  condition = {
    filetype = { "python" },
  },
}
