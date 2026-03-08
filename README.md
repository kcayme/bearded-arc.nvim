# bearded-arc.nvim

A dark Neovim colorscheme based on the [Bearded Theme Arc](https://marketplace.visualstudio.com/items?itemName=BeardedBear.beardedtheme) variant for VS Code.

## Features

- Treesitter and LSP semantic token support
- Language-specific highlights for JS/JSX, Python, Go, Svelte, CSS, and more
- 25 plugin integrations with smart auto-detection via lazy.nvim
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
| [bufferline.nvim](https://github.com/akinsho/bufferline.nvim) | `bufferline` |
| [code-action-menu.nvim](https://github.com/weilbith/nvim-code-action-menu) | `codeactionmenu` |
| [cokeline.nvim](https://github.com/willothy/nvim-cokeline) | `cokeline` |
| [flash.nvim](https://github.com/folke/flash.nvim) | `flash` |
| [fzf-lua](https://github.com/ibhagwan/fzf-lua) | `fzf` |
| [gitsigns.nvim](https://github.com/lewis6991/gitsigns.nvim) | `gitsigns` |
| [grug-far.nvim](https://github.com/MagicDuck/grug-far.nvim) | `grug-far` |
| [hop.nvim](https://github.com/smoka7/hop.nvim) | `hop` |
| [indent-blankline.nvim](https://github.com/lukas-reineke/indent-blankline.nvim) | `indent-blankline` |
| [lazy.nvim](https://github.com/folke/lazy.nvim) | `lazy` |
| [leap.nvim](https://github.com/ggandor/leap.nvim) | `leap` |
| [markview.nvim](https://github.com/OXY2DEV/markview.nvim) | `markview` |
| [mason.nvim](https://github.com/williamboman/mason.nvim) | `mason` |
| [nvim-cmp](https://github.com/hrsh7th/nvim-cmp) | `cmp` |
| [nvim-dap](https://github.com/mfussenegger/nvim-dap) | `dap` |
| [nvim-notify](https://github.com/rcarriga/nvim-notify) | `notify` |
| [nvim-tree.lua](https://github.com/nvim-tree/nvim-tree.lua) | `nvim-tree` |
| [render-markdown.nvim](https://github.com/MeanderingProgrammer/render-markdown.nvim) | `render-markdown` |
| [snacks.nvim](https://github.com/folke/snacks.nvim) | `snacks` |
| [telescope.nvim](https://github.com/nvim-telescope/telescope.nvim) | `telescope` |
| [tiny-inline-diagnostic.nvim](https://github.com/rachartier/tiny-inline-diagnostic.nvim) | `tiny-inline-diagnostic` |
| [todo-comments.nvim](https://github.com/folke/todo-comments.nvim) | `todo` |
| [trouble.nvim](https://github.com/folke/trouble.nvim) | `trouble` |
| [which-key.nvim](https://github.com/folke/which-key.nvim) | `which-key` |

## Acknowledgements

- [Bearded Theme](https://github.com/BeardedBear/bearded-theme) by BeardedBear for the original color palette
