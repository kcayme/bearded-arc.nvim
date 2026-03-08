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

## Accessing the Palette Programmatically

```lua
-- after the colorscheme is loaded
local palette = require("bearded-arc").palette()
print(palette.blue) -- #69C3FF
```

This is useful for integrating the theme colors into other plugin configurations (statuslines, etc.).
