return {
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    event = "User FilePost",
    cmd = { "TSUpdateSync", "TSUpdate", "TSInstall" },
    config = function()
      require("nvim-treesitter.configs").setup({
        ensure_installed = {
          "c",
          "lua",
          "cpp",
          "rust",
          "bash",
          "cmake",
          "python",
          "markdown",
          "markdown_inline",
          "regex",
          "vim",
          "vimdoc",
        },
        sync_install = true,
        highlight = {
          enable = true,
        },
      })
    end,
  },
}
