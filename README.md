# bearded-arc.nvim

A dark Neovim colorscheme based on the [Bearded Theme Arc](https://marketplace.visualstudio.com/items?itemName=BeardedBear.beardedtheme) variant for VS Code.

## Features

- Treesitter and LSP semantic token support
- Language-specific highlights for JS/JSX, Python, Go, Svelte, CSS, and more
- 12 plugin integrations with smart auto-detection via lazy.nvim
- Customizable via color and highlight override hooks
- Terminal color support

## Requirements

- Neovim >= 0.8.0
- `termguicolors` enabled

## Installation

### [lazy.nvim](https://github.com/folke/lazy.nvim)

```lua
{
  "karlcayme/bearded-arc.nvim",
  lazy = false,
  priority = 1000,
  opts = {},
}
```

### [packer.nvim](https://github.com/wbthomason/packer.nvim)

```lua
use { "karlcayme/bearded-arc.nvim" }
```

## Usage

```lua
vim.cmd.colorscheme("bearded-arc")
```

## Configuration

Configuration is optional. Call `setup` before loading the colorscheme to override defaults:

```lua
require("bearded-arc").setup({
  transparent = false,       -- enable background transparency
  terminal_colors = true,    -- apply ANSI terminal colors
  dim_inactive = false,      -- dim inactive windows
  styles = {
    comments = { italic = true },
    keywords = {},
    functions = {},
    variables = {},
    strings = {},
  },
  on_colors = function(colors)
    -- override palette colors
    -- colors.blue = "#89b4fa"
  end,
  on_highlights = function(highlights, palette)
    -- override highlight groups
    -- highlights.Comment = { fg = palette.muted, italic = true }
  end,
  plugins = {
    all = false,    -- load all plugin highlights
    auto = true,    -- auto-detect installed plugins via lazy.nvim
    -- override per plugin:
    -- telescope = true,
    -- gitsigns = false,
  },
})
```

## Supported Plugins

| Plugin | Key |
| --- | --- |
| [blink.cmp](https://github.com/Saghen/blink.cmp) | `blink` |
| [cokeline.nvim](https://github.com/willothy/nvim-cokeline) | `cokeline` |
| [flash.nvim](https://github.com/folke/flash.nvim) | `flash` |
| [fzf-lua](https://github.com/ibhagwan/fzf-lua) | `fzf` |
| [gitsigns.nvim](https://github.com/lewis6991/gitsigns.nvim) | `gitsigns` |
| [indent-blankline.nvim](https://github.com/lukas-reineke/indent-blankline.nvim) | `indent-blankline` |
| [lazy.nvim](https://github.com/folke/lazy.nvim) | `lazy` |
| [nvim-tree.lua](https://github.com/nvim-tree/nvim-tree.lua) | `nvim-tree` |
| [snacks.nvim](https://github.com/folke/snacks.nvim) | `snacks` |
| [telescope.nvim](https://github.com/nvim-telescope/telescope.nvim) | `telescope` |
| [trouble.nvim](https://github.com/folke/trouble.nvim) | `trouble` |
| [which-key.nvim](https://github.com/folke/which-key.nvim) | `which-key` |

## Acknowledgements

- [Bearded Theme](https://github.com/BeardedBear/bearded-theme) by BeardedBear for the original color palette
