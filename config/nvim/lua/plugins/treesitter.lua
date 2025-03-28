return {
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    event = "User FilePost",
    cmd = { "TSUpdateSync", "TSUpdate", "TSInstall" },
    lazy = vim.fn.argc(-1) == 0, -- load treesitter early when opening a file from the cmdline
    config = function()
      require("nvim-treesitter.configs").setup({
        ensure_installed = {
          "bash",
          "c",
          "cmake",
          "comment",
          "cpp",
          "lua",
          "markdown",
          "markdown_inline",
          "python",
          "regex",
          "rust",
          "vim",
          "vimdoc",
        },
        sync_install = true,
        highlight = {
          enable = true,
        },
        indent = { enable = true },
      })
    end,
  },
}
