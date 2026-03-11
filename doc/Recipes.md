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

Run the following in Neovim to confirm undercurl is active:

```vim
:highlight DiagnosticUnderlineError
```

The output should include `cterm=undercurl gui=undercurl`.

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
