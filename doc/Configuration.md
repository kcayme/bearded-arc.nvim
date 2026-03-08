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
