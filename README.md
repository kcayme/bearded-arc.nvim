# bearded-arc.nvim

[![Neovim](https://img.shields.io/badge/Neovim-%3E%3D0.8.0-57A143?logo=neovim&logoColor=white)](https://neovim.io)
[![License](https://img.shields.io/github/license/kcayme/bearded-arc.nvim)](https://github.com/kcayme/bearded-arc.nvim/blob/main/LICENSE)

A Neovim port of my favorite VSCode theme, [Bearded Theme Arc](https://marketplace.visualstudio.com/items?itemName=BeardedBear.beardedtheme).

![JSX](./assets/sample_1.png)
![Go](./assets/sample_2.png)

## Features

- Treesitter and LSP semantic token support
- Language-specific highlights for JS/JSX, Python, Go, Svelte, CSS, and more
- 29 plugin integrations with smart auto-detection via lazy.nvim
- Customizable via color and highlight override hooks
- Terminal color support

## Requirements

- Neovim >= 0.8.0
- `termguicolors` enabled

## Installation

### [lazy.nvim](https://github.com/folke/lazy.nvim)

```lua
{
  "kcayme/bearded-arc.nvim",
  lazy = false,
  priority = 1000,
  opts = {},
}
```

### [packer.nvim](https://github.com/wbthomason/packer.nvim)

```lua
use { "kcayme/bearded-arc.nvim" }
```

## Usage

```lua
vim.cmd.colorscheme("bearded-arc")
```

## Help

Full documentation is available inside Neovim:

```vim
:h bearded-arc
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

<!-- panvimdoc-ignore-start -->

## Supported Plugins

29 plugins are supported with auto-detection via lazy.nvim. See the [full list](doc/Plugins.md) for details and per-plugin configuration.

<!-- panvimdoc-ignore-end -->

<!-- panvimdoc-ignore-start -->

## Acknowledgements

- [Bearded Theme](https://github.com/BeardedBear/bearded-theme) by BeardedBear for the original color palette

<!-- panvimdoc-ignore-end -->
