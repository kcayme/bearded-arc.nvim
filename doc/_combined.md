# bearded-arc.nvim

[![Neovim](https://img.shields.io/badge/Neovim-%3E%3D0.8.0-57A143?logo=neovim&logoColor=white)](https://neovim.io)
[![License](https://img.shields.io/github/license/kcayme/bearded-arc.nvim)](https://github.com/kcayme/bearded-arc.nvim/blob/main/LICENSE)

A Neovim port of my favorite VSCode theme, [Bearded Theme Arc](https://marketplace.visualstudio.com/items?itemName=BeardedBear.beardedtheme).

![JSX](./assets/sample_1.png)
![Go](./assets/sample_2.png)

## Features

- Treesitter and LSP semantic token support
- Language-specific highlights for JS/JSX, Python, Go, Svelte, CSS, and more
- 36 plugin integrations with smart auto-detection via lazy.nvim
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

36 plugins are supported with auto-detection via lazy.nvim. See the [full list](doc/Plugins.md) for details and per-plugin configuration.

<!-- panvimdoc-ignore-end -->

<!-- panvimdoc-ignore-start -->

## Acknowledgements

- [Bearded Theme](https://github.com/BeardedBear/bearded-theme) by BeardedBear for the original color palette

<!-- panvimdoc-ignore-end -->

# Configuration

Configuration is entirely optional. Call `setup` **before** loading the colorscheme to override defaults:

```lua
require("bearded-arc").setup({
  -- options
})
vim.cmd.colorscheme("bearded-arc")
```

If `setup` is not called, the colorscheme uses sensible defaults.

## Options Reference

### `transparent`

| | |
| --- | --- |
| Type | `boolean` |
| Default | `false` |

Removes background colors from `Normal`, `NormalFloat`, `SignColumn`, `FloatBorder`, `FloatTitle`, `WinBar`, `WinBarNC`, and `FoldColumn`, allowing the terminal background to show through.

```lua
require("bearded-arc").setup({
  transparent = true,
})
```

### `terminal_colors`

| | |
| --- | --- |
| Type | `boolean` |
| Default | `true` |

Sets the 16 ANSI terminal colors (`vim.g.terminal_color_0` through `vim.g.terminal_color_15`) so that Neovim's built-in terminal matches the theme. See [Palette#Terminal Colors](Palette#terminal-colors) for the values.

```lua
require("bearded-arc").setup({
  terminal_colors = false, -- disable terminal color overrides
})
```

### `dim_inactive`

| | |
| --- | --- |
| Type | `boolean` |
| Default | `false` |

Uses a slightly darker background (`bg_dark` / `#171e2b`) for inactive windows, making it easier to distinguish the focused window.

Affected groups: `NormalNC`, `WinBarNC`.

```lua
require("bearded-arc").setup({
  dim_inactive = true,
})
```

### `styles`

| | |
| --- | --- |
| Type | `table` |
| Default | See below |

Controls font attributes for common syntax categories. Each key accepts a table of highlight attributes such as `italic`, `bold`, `underline`, `undercurl`, `strikethrough`, and `sp`.

```lua
-- defaults
styles = {
  comments  = { italic = true },
  keywords  = {},
  functions = {},
  variables = {},
  strings   = {},
}
```

These are merged into the corresponding base highlight groups using `vim.tbl_extend("force")`, so you can combine multiple attributes:

```lua
require("bearded-arc").setup({
  styles = {
    comments  = { italic = true, bold = true },
    keywords  = { italic = true },
    functions = { bold = true },
    variables = {},
    strings   = { italic = true },
  },
})
```

**Which groups are affected:**

| Style key | Highlight groups |
| --- | --- |
| `comments` | `Comment` |
| `keywords` | `Keyword`, `Conditional`, `Repeat`, `Exception` |
| `functions` | `Function` |
| `variables` | `Identifier` |
| `strings` | `String` |

### `on_colors`

| | |
| --- | --- |
| Type | `function(colors)` |
| Default | `function(colors) end` |

A callback invoked during palette setup, **before** highlight groups are generated. Use this to override any palette color. The `colors` table is mutated in place.

```lua
require("bearded-arc").setup({
  on_colors = function(colors)
    colors.blue = "#89b4fa"
    colors.bg = "#1e1e2e"
  end,
})
```

See [Palette](Palette) for all available color keys.

### `on_highlights`

| | |
| --- | --- |
| Type | `function(highlights, colors)` |
| Default | `function(highlights, colors) end` |

A callback invoked **after** all highlight groups have been generated but **before** they are applied. Use this to override or add highlight groups. Both arguments are mutated in place.

- `highlights` - table of all highlight group definitions
- `colors` - the resolved palette (after `on_colors`)

```lua
require("bearded-arc").setup({
  on_highlights = function(hl, c)
    hl.Comment = { fg = c.fg_muted, italic = true }
    hl.CursorLine = { bg = "#2a3445" }
  end,
})
```

### `plugins`

| | |
| --- | --- |
| Type | `table` |
| Default | See below |

Controls which plugin highlight groups are loaded. See [Plugins](Plugins) for full details.

```lua
-- defaults
plugins = {
  all  = package.loaded.lazy == nil, -- true if lazy.nvim is NOT loaded
  auto = true,                       -- auto-detect via lazy.nvim
}
```

| Key | Type | Description |
| --- | --- | --- |
| `all` | `boolean` | If `true`, load highlights for every supported plugin regardless of detection. Defaults to `true` only when lazy.nvim is not present. |
| `auto` | `boolean` | If `true`, detect installed plugins through `lazy.nvim` and load only their highlights. |
| `<plugin-key>` | `boolean` | Force-enable (`true`) or force-disable (`false`) a specific plugin. Overrides both `all` and `auto`. |

```lua
require("bearded-arc").setup({
  plugins = {
    all = false,
    auto = true,
    telescope = true,  -- always load telescope highlights
    gitsigns = false,  -- never load gitsigns highlights
  },
})
```

## Full Default Configuration

```lua
require("bearded-arc").setup({
  transparent = false,
  terminal_colors = true,
  dim_inactive = false,
  styles = {
    comments = { italic = true },
    keywords = {},
    functions = {},
    variables = {},
    strings = {},
  },
  on_colors = function(colors) end,
  on_highlights = function(highlights, colors) end,
  plugins = {
    all = package.loaded.lazy == nil,
    auto = true,
  },
})
```

# Recipes

Common customization patterns for bearded-arc.nvim.

## Transparent Background

```lua
require("bearded-arc").setup({
  transparent = true,
})
```

## Italic Keywords

```lua
require("bearded-arc").setup({
  styles = {
    keywords = { italic = true },
  },
})
```

## Bold Functions and Italic Comments

```lua
require("bearded-arc").setup({
  styles = {
    comments = { italic = true },
    functions = { bold = true },
  },
})
```

## No Italics at All

```lua
require("bearded-arc").setup({
  styles = {
    comments = {},
  },
})
```

## Catppuccin-Flavored Greens

Override the green palette color to change strings, success diagnostics, and diffs everywhere:

```lua
require("bearded-arc").setup({
  on_colors = function(colors)
    colors.green = "#a6e3a1"
  end,
})
```

## Custom Background

```lua
require("bearded-arc").setup({
  on_colors = function(colors)
    colors.bg = "#1e1e2e"
    colors.bg_dark = "#181825"
    colors.bg_float = "#1e1e2e"
  end,
})
```

## Borderless Telescope

```lua
require("bearded-arc").setup({
  on_highlights = function(hl, c)
    hl.TelescopeNormal = { fg = c.fg, bg = c.bg_dark }
    hl.TelescopeBorder = { fg = c.bg_dark, bg = c.bg_dark }
    hl.TelescopePromptNormal = { fg = c.fg, bg = c.bg_popup }
    hl.TelescopePromptBorder = { fg = c.bg_popup, bg = c.bg_popup }
    hl.TelescopePromptTitle = { fg = c.bg, bg = c.blue, bold = true }
    hl.TelescopePreviewTitle = { fg = c.bg, bg = c.green, bold = true }
    hl.TelescopeResultsTitle = { fg = c.bg_dark, bg = c.bg_dark }
  end,
})
```

## Brighter Line Numbers

```lua
require("bearded-arc").setup({
  on_highlights = function(hl, c)
    hl.LineNr = { fg = c.fg_muted }
    hl.CursorLineNr = { fg = c.yellow, bold = true }
  end,
})
```

## Enabling Undercurl

bearded-arc uses `undercurl` for diagnostics and spell-check highlights by default. If undercurls appear as plain underlines, your terminal or multiplexer likely needs configuration.

### Supported Terminals

Undercurl works out of the box in: **Kitty**, **WezTerm**, **Ghostty**, **iTerm2** (3.4+), **Alacritty** (0.14+), **foot**.

**Apple Terminal does not support undercurl.**

### tmux

tmux strips undercurl escape sequences by default. Add the following to `~/.tmux.conf`:

```tmux
set -g default-terminal "tmux-256color"
set -as terminal-overrides ',*:Smulx=\E[4::%p1%dm'
set -as terminal-overrides ',*:Setulc=\E[58::2::%p1%{65536}%/%d::%p1%{256}%/%{255}%&%d::%p1%{255}%&%d%;m'
```

Then restart tmux completely:

```sh
tmux kill-server
```

### Verifying

Run the following in your terminal to confirm undercurl rendering works:

```sh
printf '\e[4:3m undercurl \e[0m\n'
```

You should see "undercurl" with a **wavy underline**. If it appears as a straight underline or not at all, your terminal (or tmux) is not handling undercurl escape sequences correctly.

## Custom Cursor Hover Highlights

Override the highlight used when the cursor hovers over a symbol (via `vim.lsp.buf.document_highlight`):

```lua
require("bearded-arc").setup({
  on_highlights = function(hl, c)
    hl.LspReferenceText = { bg = c.bg_visual }
    hl.LspReferenceRead = { bg = c.bg_visual }
    hl.LspReferenceWrite = { bg = c.bg_visual, bold = true }
  end,
})
```

## Underline Diagnostics Instead of Undercurl

```lua
require("bearded-arc").setup({
  on_highlights = function(hl, c)
    hl.DiagnosticUnderlineError = { underline = true, sp = c.error }
    hl.DiagnosticUnderlineWarn = { underline = true, sp = c.warning }
    hl.DiagnosticUnderlineInfo = { underline = true, sp = c.info }
    hl.DiagnosticUnderlineHint = { underline = true, sp = c.hint }
  end,
})
```

## Dim Inactive Windows with Transparency

```lua
require("bearded-arc").setup({
  transparent = true,
  dim_inactive = true,
})
```

Note: When both are enabled, inactive windows use `bg_dark` while the active window has a transparent background.

## Importing the Palette

The palette can be imported for use in other plugin configurations:

```lua
local palette = require("bearded-arc").palette()
```

This works at any point — even before loading the colorscheme. If `setup()` hasn't been called yet, it auto-initializes with defaults. The returned table includes all palette colors and respects any `on_colors` overrides.

### Statusline (lualine.nvim)

```lua
local c = require("bearded-arc").palette()

require("lualine").setup({
  options = {
    theme = {
      normal = {
        a = { fg = c.bg, bg = c.blue, gui = "bold" },
        b = { fg = c.fg, bg = c.bg_popup },
        c = { fg = c.fg_muted, bg = c.bg_status },
      },
      insert = { a = { fg = c.bg, bg = c.green, gui = "bold" } },
      visual = { a = { fg = c.bg, bg = c.purple, gui = "bold" } },
      command = { a = { fg = c.bg, bg = c.yellow, gui = "bold" } },
      replace = { a = { fg = c.bg, bg = c.red, gui = "bold" } },
      inactive = {
        a = { fg = c.fg_dim, bg = c.bg_dark },
        b = { fg = c.fg_dim, bg = c.bg_dark },
        c = { fg = c.fg_dim, bg = c.bg_dark },
      },
    },
  },
})
```

### Statusline (heirline.nvim)

```lua
local c = require("bearded-arc").palette()

local colors = {
  bg = c.bg_status,
  fg = c.fg,
  blue = c.blue,
  green = c.green,
  red = c.red,
  yellow = c.yellow,
  purple = c.purple,
  muted = c.fg_dim,
}

require("heirline").setup({
  opts = { colors = colors },
  -- ...
})
```

### Indent line color

```lua
local c = require("bearded-arc").palette()

require("ibl").setup({
  indent = { char = "│", highlight = "IblIndent" },
  scope = { highlight = "IblScope" },
})

vim.api.nvim_set_hl(0, "IblIndent", { fg = c.bg_popup })
vim.api.nvim_set_hl(0, "IblScope", { fg = c.fg_dim })
```

### Available colors

| Category | Keys |
| --- | --- |
| Backgrounds | `bg`, `bg_dark`, `bg_darker`, `bg_float`, `bg_popup`, `bg_visual`, `bg_status`, `bg_highlight` |
| Foregrounds | `fg`, `fg_muted`, `fg_dim`, `fg_gutter` |
| Accents | `blue`, `green`, `yellow`, `red`, `cyan`, `purple`, `magenta`, `orange`, `pink`, `lime` |
| Semantic | `error`, `warning`, `info`, `hint`, `success` |
| Special | `none` (transparent) |
