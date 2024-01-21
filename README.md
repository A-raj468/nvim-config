# Nvim Config

I am trying to make my own nvim config from scratch using [lazy.nvim](https://github.com/folke/lazy.nvim.git). This time I am not following any tutorials.

I am using windows 11, copying the config should also work on linux(but I am not sure).

## Table of content

[Nvim Config](#nvim-config)

-   [Table of content](#table-of-content)
-   [Before you begin](#before-you-begin)
-   [Plugins involved](#plugins-involved)

## Before you begin

Insure you have neovim 0.9.\* installed.

```console
$ nvim --version
NVIM v0.9.5
Build type: RelWithDebInfo
LuaJIT 2.1.1703942320
```

Copy your current config and local nvim-data.

If you are using windows, you also need to have `clang` installed.

## Plugins involved

-   [telescope.nvim](https://github.com/nvim-telescope/telescope.nvim.git)
    -   [telescope-ui-select.nvim](https://github.com/nvim-telescope/telescope-ui-select.nvim.git)
-   [nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter.git)
-   appearance
    -   [catppuccin](https://github.com/catppuccin/nvim.git)
    -   [lualine](https://github.com/nvim-lualine/lualine.nvim.git)
-   [nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter.git)
-   LSP stuff
