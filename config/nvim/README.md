# Neovim Config

## Guide for lua in neovim

* [nvim-lua-guide](https://neovim.io/doc/user/lua-guide.html#lua-guide)

## Plugins

* Plugin Manager: [lazy.nvim](https://github.com/folke/lazy.nvim)
* LSP:
    * Basic config:
        * [nvim-lspconfig](https://github.com/neovim/nvim-lspconfig)
* Diagnostic Info:
    * List for showing diagnostics: [trouble.nvim](https://github.com/folke/trouble.nvim)
* Completion: [blink.cmp](https://github.com/Saghen/blink.cmp)
* Finder: [snacks.picker](https://github.com/folke/snacks.nvim/blob/main/docs/picker.md) 
* File Explorer: [snacks.explorer](https://github.com/folke/snacks.nvim/blob/main/docs/explorer.md)
* Syntax Highlighting: [nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter)
* Autopairs: [nvim-autopairs](https://github.com/windwp/nvim-autopairs)
* Format: [conform.nvim](https://github.com/stevearc/conform.nvim)
* Statusline: [lualine.nvim](https://github.com/nvim-lualine/lualine.nvim)
* LSP Status: [snacks.notifier](https://github.com/folke/snacks.nvim/blob/main/docs/notifier.md)
* Bufferline: [bufferline.nvim](https://github.com/akinsho/bufferline.nvim)
* Colorscheme: [tokyonight.nvim](https://github.com/folke/tokyonight.nvim)
* Enhanced code navigation: [flash.nvim](https://github.com/folke/flash.nvim)
* Incremental LSP renaming: [live-rename.nvim](https://github.com/saecki/live-rename.nvim)
* Surround selection: [nvim-surround](https://github.com/kylechui/nvim-surround)
* Git: [gitsigns.nvim](https://github.com/lewis6991/gitsigns.nvim)
* Colorizer: [nvim-colorizer.lua](https://github.com/catgoose/nvim-colorizer.lua)
* Task Manager: [overseer.nvim](https://github.com/stevearc/overseer.nvim)
* Enhanced Search: [nvim-hlslens](https://github.com/kevinhwang91/nvim-hlslens)

## Key Bingings

| Key          | Action                                    |
| ------------ | ----------------------------------------- |
| Meta + e     | Toggle file explorer                      |
| Meta + f     | Format code                               |
| Meta + `num` | Goto buffer `num`                         |
| Meta + n     | Goto next tab                             |
| Meta + p     | Goto previous tab                         |
| Meta + d     | Close current buffer                      |
| ]d           | Goto next diagnostic                      |
| [d           | Goto prev diagnostic                      |
| Meta + r     | Rename                                    |
| gd           | Goto declaration                          |
| gr           | Show all reference                        |
| K            | Hover                                     |
| ga           | Code Actions                              |
| Leader + xx  | Show all diagnostic messages              |
| Leader + o   | Show all document symbols                 |
| Leader + r   | Run overseer task                         |
| Leader + ff  | Search files                              |
| Leader + fg  | Live grep                                 |
| Leader + fb  | Search buffer                             |

## Screenshots

![nvim](https://github.com/user-attachments/assets/a170f865-7929-4fc4-9842-c3302f4fe9b7)
