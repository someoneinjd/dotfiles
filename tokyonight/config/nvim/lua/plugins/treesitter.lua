return {
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
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
        },
        sync_install = true,
        highlight = {
          enable = true,
        },
      })
    end,
  },
}
