# Palette

All colors are defined in `lua/bearded-arc/palette.lua`. Every key listed below is available inside `on_colors` and `on_highlights` callbacks.

## Backgrounds

| Key | Hex | Used for |
| --- | --- | --- |
| `bg` | `#1c2433` | Main editor background |
| `bg_dark` | `#171e2b` | Darker areas (inactive windows, status line NC, virtual text) |
| `bg_darker` | `#121822` | Darkest areas (tabline fill) |
| `bg_float` | `#1a2130` | Floating windows |
| `bg_popup` | `#263042` | Popup menus (Pmenu) |
| `bg_visual` | `#2b374b` | Visual selection, win separators |
| `bg_status` | `#212a3a` | Status line |
| `bg_highlight` | `#263042` | Cursor line, search, color column |

## Foregrounds

| Key | Hex | Used for |
| --- | --- | --- |
| `fg` | `#d8dde7` | Main text |
| `fg_muted` | `#8196b5` | Secondary text, delimiters |
| `fg_dim` | `#536686` | Comments, dim text, non-text |
| `fg_gutter` | `#506a8a` | Line numbers, sign column, float borders |

## Accent Colors

| Key | Hex | Primary usage |
| --- | --- | --- |
| `blue` | `#69C3FF` | Functions, tags, titles, info diagnostics |
| `green` | `#3CEC85` | Strings, characters, added diffs, success |
| `yellow` | `#EACD61` | Keywords, operators, statements, todo |
| `red` | `#E35535` | Constants, numbers, booleans, errors |
| `cyan` | `#22ECDB` | Storage class, search, special |
| `purple` | `#B78AFF` | Types, structures, typedefs |
| `magenta` | `#F38CEC` | Parameters |
| `orange` | `#FF955C` | Warnings, debug, match paren |
| `pink` | `#FF738A` | Variables (identifiers), labels, special chars |
| `lime` | `#A4EF58` | Special strings |

## Semantic Colors

| Key | Hex | Maps to |
| --- | --- | --- |
| `error` | `#E35535` | `DiagnosticError` |
| `warning` | `#FF955C` | `DiagnosticWarn` |
| `info` | `#69C3FF` | `DiagnosticInfo` |
| `hint` | `#4a5e78` | `DiagnosticHint` |
| `success` | `#3CEC85` | `DiagnosticOk` |

## Base30 Aliases

These provide compatibility-friendly names that map to the core palette:

| Key | Hex | Alias for |
| --- | --- | --- |
| `black` | `#1c2433` | `bg` |
| `darker_black` | `#171e2b` | `bg_dark` |
| `white` | `#d8dde7` | `fg` |
| `grey` | `#506a8a` | `fg_gutter` |
| `sun` | `#f0db8e` | Bright yellow (CurSearch) |
| `statusline_bg` | `#212a3a` | `bg_status` |
| `light_grey` | `#7a8da6` | Lighter grey |
| `one_bg` | `#263042` | `bg_popup` / `bg_highlight` |
| `one_bg2` | `#2b374b` | `bg_visual` |
| `one_bg3` | `#344055` | Lighter background |
| `pmenu_bg` | `#69C3FF` | `blue` |
| `line` | `#2b374b` | `bg_visual` |
| `nord_blue` | `#5aadea` | Muted blue |
| `teal` | `#22ECDB` | `cyan` |
| `baby_pink` | `#FF738A` | `pink` |
| `vibrant_green` | `#3CEC85` | `green` |
| `dark_purple` | `#9a6ee0` | Muted purple |

## Terminal Colors

The 16 ANSI colors applied when `terminal_colors = true`:

| Index | Name | Normal | Bright |
| --- | --- | --- | --- |
| 0 / 8 | Black | `#0f1218` | `#526587` |
| 1 / 9 | Red | `#E35535` | `#e97b62` |
| 2 / 10 | Green | `#3CEC85` | `#6af1a2` |
| 3 / 11 | Yellow | `#EACD61` | `#f0db8e` |
| 4 / 12 | Blue | `#69C3FF` | `#9cd7ff` |
| 5 / 13 | Magenta | `#F38CEC` | `#f8baf4` |
| 6 / 14 | Cyan | `#22ECDB` | `#51f0e3` |
| 7 / 15 | White | `#FFFFFF` | `#f8f9fa` |

## Overriding Colors

Use the `on_colors` hook to modify any palette key before highlights are generated:

```lua
require("bearded-arc").setup({
  on_colors = function(colors)
    colors.bg = "#1e1e2e"        -- change the main background
    colors.green = "#a6e3a1"     -- change all greens (strings, success, etc.)
    colors.error = "#f38ba8"     -- change error color across all diagnostics
  end,
})
```

Changes propagate everywhere the color key is referenced, so overriding `green` changes strings, success diagnostics, diff added, and any plugin groups that use it.
