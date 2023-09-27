# Neovim Config

This is my neovim configurations (pure lua)

## Guide for lua in neovim

* [nvim-lua-guide](https://github.com/nanotee/nvim-lua-guide)

## Other Configurations

[here](https://github.com/someoneinjd/dotfiles-mac/tree/main/config/nvim) is my another nvim configuration (pure vimscript), and [here](../nvim-min/) is a minimal configuration without external dependencies.

## Plugins

* Plugin Manager: [lazy.nvim](https://github.com/folke/lazy.nvim)
* LSP:
    * Basic config:
        * [nvim-lspconfig](https://github.com/neovim/nvim-lspconfig)
        * [lsp-zero.nvim](https://github.com/VonHeikemen/lsp-zero.nvim)
* Diagnostic Info:
    * List for showing diagnostics: [trouble.nvim](https://github.com/folke/trouble.nvim)
* Signature Help: [lsp_signature.nvim](https://github.com/ray-x/lsp_signature.nvim)
* Completion: [nvim-cmp](https://github.com/hrsh7th/nvim-cmp)
* Snippet: [LuaSnip](https://github.com/L3MON4D3/LuaSnip)
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

## Key Bingings

| Key         | Action                                    |
| ----------- | ----------------------------------------- |
| Meta + e    | Toggle file explorer                      |
| Meta + f    | Format code                               |
| Meta + n    | Goto next tab                             |
| Meta + p    | Goto previous tab                         |
| Meta + d    | Close current tab/terminal                |
| gd          | Goto declaration                          |
| gr          | Show all reference                        |
| K           | Hover                                     |
| <F4>        | Code Actions                              |
| <F2>        | Rename                                    |
| Leader + xx | Show all diagnostic messages              |
| Leader + ff | Search files                              |
| Leader + fg | Live grep                                 |
| Leader + fb | Search buffer                             |

## Screenshots

![](../../../img/normal.png)

![](../../../img/compe.png)
