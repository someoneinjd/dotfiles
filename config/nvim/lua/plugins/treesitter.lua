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
          "diff",
          "html",
          "json",
          "jsonc",
          "lua",
          "markdown",
          "markdown_inline",
          "python",
          "regex",
          "rust",
          "toml",
          "vim",
          "vimdoc",
          "xml",
          "yaml",
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
