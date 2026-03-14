# bearded-arc.nvim

[![Neovim](https://img.shields.io/badge/Neovim-%3E%3D0.8.0-57A143?logo=neovim&logoColor=white)](https://neovim.io)
[![License](https://img.shields.io/github/license/kcayme/bearded-arc.nvim)](https://github.com/kcayme/bearded-arc.nvim/blob/main/LICENSE)

A dark Neovim colorscheme inspired by [Bearded Theme Arc](https://marketplace.visualstudio.com/items?itemName=BeardedBear.beardedtheme) for VSCode. Deep navy backgrounds with vivid accent colors — full Treesitter, LSP semantic token support, and 71 plugin integrations.

![JSX syntax highlighting in bearded-arc.nvim Neovim colorscheme](./assets/sample_1.png)
![Go syntax highlighting in bearded-arc.nvim Neovim colorscheme](./assets/sample_2.png)

## Features

- Full [Treesitter](https://github.com/nvim-treesitter/nvim-treesitter) highlight support
- LSP semantic token highlights
- Language-specific highlights for JS/JSX/TSX, Python, Go, Svelte, CSS, and more
- 71 plugin integrations with smart auto-detection via [lazy.nvim](https://github.com/folke/lazy.nvim)
- Customizable via `on_colors` and `on_highlights` hooks
- Terminal colors (16 ANSI colors)
- Transparent background support

## Color Palette

Deep navy backgrounds with vivid, readable accent colors:

| Color | Hex | Used for |
| --- | --- | --- |
| Background | `#1c2433` | Main editor background |
| Blue | `#69C3FF` | Functions, tags, titles, info diagnostics |
| Green | `#3CEC85` | Strings, characters, added diffs |
| Yellow | `#EACD61` | Keywords, operators, statements |
| Red | `#E35535` | Constants, numbers, booleans, errors |
| Cyan | `#22ECDB` | Storage class, search, special |
| Purple | `#B78AFF` | Types, structures, typedefs |
| Magenta | `#F38CEC` | Parameters |
| Orange | `#FF955C` | Warnings, debug |
| Pink | `#FF738A` | Variables, labels, special chars |

See [Palette docs](doc/Palette.md) for the full reference including all background shades, semantic colors, and terminal colors.

## Requirements

- Neovim >= 0.8.0
- `termguicolors` enabled

## Installation

### [vim.pack](https://neovim.io/doc/user/pack.html) (Neovim 0.11+ built-in)

```lua
vim.pack.add({ 'https://github.com/kcayme/bearded-arc.nvim' })
vim.cmd.colorscheme("bearded-arc")
```

Since `vim.pack` doesn't use lazy.nvim, plugin auto-detection won't work. Enable all plugin highlights or specify them manually:

```lua
require("bearded-arc").setup({
  plugins = {
    all = true, -- load all 71 plugin highlight groups
  },
})
```

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

## Configuration

Configuration is optional. Call `setup` before loading the colorscheme to override defaults:

```lua
require("bearded-arc").setup({
  transparent = false,       -- enable background transparency
  terminal_colors = true,    -- apply ANSI terminal colors
  dim_inactive = false,      -- dim inactive windows
  styles = {
    comments  = { italic = true },
    keywords  = {},
    functions = {},
    variables = {},
    strings   = {},
    sidebars  = "dark",      -- "dark" | "transparent" | "normal"
    floats    = "dark",      -- "dark" | "transparent" | "normal"
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

See [Configuration docs](doc/Configuration.md) for all options and [Recipes](doc/Recipes.md) for common customization examples.

## Help

Full documentation is available inside Neovim:

```vim
:h bearded-arc
```

<!-- panvimdoc-ignore-start -->

## Supported Plugins

71 plugins are supported with auto-detection via lazy.nvim:

[aerial.nvim](https://github.com/stevearc/aerial.nvim) · [alpha-nvim](https://github.com/goolord/alpha-nvim) · [atone.nvim](https://github.com/XXiaoA/atone.nvim) · [avante.nvim](https://github.com/yetone/avante.nvim) · [barbar.nvim](https://github.com/romgrk/barbar.nvim) · [beacon.nvim](https://github.com/DanilaMihailov/beacon.nvim) · [blink.cmp](https://github.com/Saghen/blink.cmp) · [bufferline.nvim](https://github.com/akinsho/bufferline.nvim) · [coc.nvim](https://github.com/neoclide/coc.nvim) · [codeium.nvim](https://github.com/Exafunction/codeium.nvim) · [code-action-menu.nvim](https://github.com/weilbith/nvim-code-action-menu) · [cokeline.nvim](https://github.com/willothy/nvim-cokeline) · [colorful-winsep.nvim](https://github.com/nvim-zh/colorful-winsep.nvim) · [copilot.vim](https://github.com/github/copilot.vim) · [copilot.lua](https://github.com/zbirenbaum/copilot.lua) · [CopilotChat.nvim](https://github.com/CopilotC-Nvim/CopilotChat.nvim) · [dashboard-nvim](https://github.com/nvimdev/dashboard-nvim) · [diffview.nvim](https://github.com/sindrets/diffview.nvim) · [dropbar.nvim](https://github.com/Bekaboo/dropbar.nvim) · [fff.nvim](https://github.com/kcayme/fff.nvim) · [fidget.nvim](https://github.com/j-hui/fidget.nvim) · [flash.nvim](https://github.com/folke/flash.nvim) · [fzf-lua](https://github.com/ibhagwan/fzf-lua) · [gitsigns.nvim](https://github.com/lewis6991/gitsigns.nvim) · [grug-far.nvim](https://github.com/MagicDuck/grug-far.nvim) · [harpoon](https://github.com/ThePrimeagen/harpoon) · [headlines.nvim](https://github.com/lukas-reineke/headlines.nvim) · [hop.nvim](https://github.com/smoka7/hop.nvim) · [indent-blankline.nvim](https://github.com/lukas-reineke/indent-blankline.nvim) · [lazy.nvim](https://github.com/folke/lazy.nvim) · [leap.nvim](https://github.com/ggandor/leap.nvim) · [lspsaga.nvim](https://github.com/nvimdev/lspsaga.nvim) · [markview.nvim](https://github.com/OXY2DEV/markview.nvim) · [mason.nvim](https://github.com/williamboman/mason.nvim) · [mini.nvim](https://github.com/echasnovski/mini.nvim) · [neo-tree.nvim](https://github.com/nvim-neo-tree/neo-tree.nvim) · [neogit](https://github.com/NeogitOrg/neogit) · [neotest](https://github.com/nvim-neotest/neotest) · [noice.nvim](https://github.com/folke/noice.nvim) · [nvim-bqf](https://github.com/kevinhwang91/nvim-bqf) · [nvim-cmp](https://github.com/hrsh7th/nvim-cmp) · [nvim-dap](https://github.com/mfussenegger/nvim-dap) · [nvim-dap-ui](https://github.com/rcariga/nvim-dap-ui) · [nvim-navic](https://github.com/SmiteshP/nvim-navic) · [nvim-notify](https://github.com/rcariga/nvim-notify) · [nvim-scrollbar](https://github.com/petertriho/nvim-scrollbar) · [nvim-spectre](https://github.com/nvim-pack/nvim-spectre) · [nvim-surround](https://github.com/kylechui/nvim-surround) · [nvim-tree.lua](https://github.com/nvim-tree/nvim-tree.lua) · [nvim-treesitter-context](https://github.com/nvim-treesitter/nvim-treesitter-context) · [nvim-ufo](https://github.com/kevinhwang91/nvim-ufo) · [obsidian.nvim](https://github.com/epwalsh/obsidian.nvim) · [octo.nvim](https://github.com/pwntester/octo.nvim) · [oil.nvim](https://github.com/stevearc/oil.nvim) · [outline.nvim](https://github.com/hedyhli/outline.nvim) · [overseer.nvim](https://github.com/stevearc/overseer.nvim) · [rainbow-delimiters.nvim](https://github.com/HiPhish/rainbow-delimiters.nvim) · [render-markdown.nvim](https://github.com/MeanderingProgrammer/render-markdown.nvim) · [sidekick.nvim](https://github.com/folke/sidekick.nvim) · [snacks.nvim](https://github.com/folke/snacks.nvim) · [supermaven-nvim](https://github.com/supermaven-inc/supermaven-nvim) · [telekasten.nvim](https://github.com/nvim-telekasten/telekasten.nvim) · [telescope.nvim](https://github.com/nvim-telescope/telescope.nvim) · [tiny-inline-diagnostic.nvim](https://github.com/rachartier/tiny-inline-diagnostic.nvim) · [todo-comments.nvim](https://github.com/folke/todo-comments.nvim) · [trouble.nvim](https://github.com/folke/trouble.nvim) · [twilight.nvim](https://github.com/folke/twilight.nvim) · [vim-dadbod-ui](https://github.com/kristijanhusak/vim-dadbod-ui) · [vim-gitgutter](https://github.com/airblade/vim-gitgutter) · [vim-illuminate](https://github.com/RRethy/vim-illuminate) · [vim-signify](https://github.com/mhinz/vim-signify) · [which-key.nvim](https://github.com/folke/which-key.nvim) · [zen-mode.nvim](https://github.com/folke/zen-mode.nvim)

See the [full plugin list](doc/Plugins.md) for highlight group counts and per-plugin configuration options.

## Acknowledgements

- [Bearded Theme](https://github.com/BeardedBear/bearded-theme) by BeardedBear for the original color palette

<!-- panvimdoc-ignore-end -->
