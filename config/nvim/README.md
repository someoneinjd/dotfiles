# Neovim Config

## Guide for lua in neovim

* [nvim-lua-guide](https://neovim.io/doc/user/lua-guide.html#lua-guide)

## Other Configurations

[here](../nvim-min/) is a minimal configuration without external dependencies.

## Plugins

* Plugin Manager: [lazy.nvim](https://github.com/folke/lazy.nvim)
* LSP:
    * Basic config:
        * [nvim-lspconfig](https://github.com/neovim/nvim-lspconfig)
* Diagnostic Info:
    * List for showing diagnostics: [trouble.nvim](https://github.com/folke/trouble.nvim)
* Completion: [blink.cmp](https://github.com/Saghen/blink.cmp)
* Finder: [telescope.nvim](https://github.com/nvim-telescope/telescope.nvim) 
* File Explorer: [nvim-tree.lua](https://github.com/kyazdani42/nvim-tree.lua)
* Syntax Highlighting: [nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter)
* Autopairs: [nvim-autopairs](https://github.com/windwp/nvim-autopairs)
* Format: [formatter.nvim](https://github.com/mhartington/formatter.nvim)
* Statusline: [lualine.nvim](https://github.com/nvim-lualine/lualine.nvim)
* LSP Status: [fidget.nvim](https://github.com/j-hui/fidget.nvim)
* Bufferline: [bufferline.nvim](https://github.com/akinsho/bufferline.nvim)
* Colorscheme: [tokyonight.nvim](https://github.com/folke/tokyonight.nvim)
* Enhanced code navigation: [flash.nvim](https://github.com/folke/flash.nvim)
* Incremental LSP renaming: [inc-rename.nvim](https://github.com/smjonas/inc-rename.nvim) 
* Surround selection: [nvim-surround](https://github.com/kylechui/nvim-surround)
* Git: [gitsigns.nvim](https://github.com/lewis6991/gitsigns.nvim)
* Colorizer: [nvim-colorizer.lua](https://github.com/catgoose/nvim-colorizer.lua)

## Key Bingings

| Key          | Action                                    |
| ------------ | ----------------------------------------- |
| Meta + e     | Toggle file explorer                      |
| Meta + f     | Format code                               |
| Meta + `num` | Goto buffer `num`                         |
| Meta + n     | Goto next tab                             |
| Meta + p     | Goto previous tab                         |
| Meta + d     | Close current buffer                      |
| [d           | Goto next diagnostic                      |
| ]d           | Goto prev diagnostic                      |
| Meta + r     | Rename                                    |
| gd           | Goto declaration                          |
| gr           | Show all reference                        |
| K            | Hover                                     |
| ga           | Code Actions                              |
| Leader + d   | Show all diagnostic messages              |
| Leader + o   | Show all document symbols                 |
| Leader + f   | Search files                              |
| Leader + g   | Live grep                                 |
| Leader + b   | Search buffer                             |

## Screenshots

![nvim](https://github.com/user-attachments/assets/a170f865-7929-4fc4-9842-c3302f4fe9b7)
