# Neovim Config

This is my old neovim config files(pure vimscript)

## Plugins

* Plugin Manager: [vim-plug](https://github.com/junegunn/vim-plug)

* LSP: [coc.nvim](https://github.com/neoclide/coc.nvim)

* File Explorer: [coc-explorer](https://github.com/weirongxu/coc-explorer)
* C/C++ Semantic Highlighting: [vim-lsp-cxx-highlight](https://github.com/jackguo380/vim-lsp-cxx-highlight)
* Autopair: [coc-pairs](https://github.com/neoclide/coc-pairs)
* Rust: [rust.vim](https://github.com/rust-lang/rust.vim)
* Terminal: [vim-floaterm](https://github.com/voldikss/vim-floaterm)
* Format: [neoformat](https://github.com/sbdchd/neoformat)
* Statusline && bufferline: [vim-airline](https://github.com/vim-airline/vim-airline)
* Colorscheme: [dracula](https://github.com/dracula/vim)

## Key Bindings

| Key         | Action                       |
| ----------- | ---------------------------- |
| Meta + e    | Open file explorer(floating) |
| Meta + t    | Open terminal(floating)      |
| Meta + f    | Format code                  |
| Meta + n    | Goto next tab                |
| Meta + p    | Goto previous tab            |
| Meta + d    | Close current tab            |
| Meta + r    | Rename                       |
| Meta + k    | Show Signature Help          |
| gd          | Goto declaration             |
| gr          | Show all references          |
| gi          | Goto implementation          |
| gy          | Goto type declaration        |
| gn          | Goto next error              |
| K           | Hover                        |
| Leader + xx | Show all diagnostic messages |
| Leader + fs | Search symbols               |

## Screenshots

![](../../../img/normal-coc.png)

![](../../../img/hover-coc.png)

![](../../../img/file-coc.png)

![](../../../img/term-coc.png)

