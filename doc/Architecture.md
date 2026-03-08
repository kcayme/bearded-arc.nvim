# Architecture

This page describes the internal structure of bearded-arc.nvim, how data flows from configuration to applied highlights, and the conventions each module follows.

## Directory Layout

```
bearded-arc.nvim/
├── colors/
│   └── bearded-arc.lua          # Vim colorscheme entry point
└── lua/bearded-arc/
    ├── init.lua                  # Public API (setup, load, palette)
    ├── config.lua                # Configuration management
    ├── palette.lua               # Color palette definition
    ├── util.lua                  # Color math utilities
    └── groups/
        ├── init.lua              # Group loader and plugin detection
        ├── base.lua              # Editor UI + Vim syntax highlights
        ├── treesitter.lua        # Treesitter scope highlights
        ├── semantic_tokens.lua   # LSP semantic token highlights
        ├── blink.lua             # blink.cmp
        ├── cokeline.lua          # cokeline.nvim
        ├── flash.lua             # flash.nvim
        ├── fzf.lua               # fzf-lua
        ├── gitsigns.lua          # gitsigns.nvim
        ├── indent-blankline.lua  # indent-blankline.nvim
        ├── lazy.lua              # lazy.nvim
        ├── nvim-tree.lua         # nvim-tree.lua
        ├── snacks.lua            # snacks.nvim
        ├── telescope.lua         # telescope.nvim
        ├── trouble.lua           # trouble.nvim
        └── which-key.lua         # which-key.nvim
```

## Load Sequence

When the user sets the colorscheme with `vim.cmd.colorscheme("bearded-arc")`, Neovim sources `colors/bearded-arc.lua`, which calls `require("bearded-arc").load()`. The full sequence is:

```
vim.cmd.colorscheme("bearded-arc")
│
├─ colors/bearded-arc.lua
│  └─ require("bearded-arc").load()
│
└─ init.lua :: load()
   │
   ├─ 1. Ensure config exists
   │     config.setup({}) is called if setup() was never called,
   │     so the colorscheme works without explicit configuration.
   │
   ├─ 2. Reset highlights
   │     vim.cmd("hi clear")
   │     vim.g.colors_name = "bearded-arc"
   │     vim.o.termguicolors = true
   │     vim.o.background = "dark"
   │
   ├─ 3. Build palette
   │     palette.setup(opts)
   │     └─ Defines all colors → calls opts.on_colors(colors)
   │        (user mutates the table in place)
   │
   ├─ 4. Build highlight groups
   │     groups.setup(palette, opts)
   │     ├─ Always loads: base, treesitter, semantic_tokens
   │     └─ Conditionally loads enabled plugin groups
   │
   ├─ 5. User highlight overrides
   │     opts.on_highlights(groups, palette)
   │     (user mutates the table in place)
   │
   ├─ 6. Apply highlights
   │     for group, hl in pairs(groups) do
   │       vim.api.nvim_set_hl(0, group, hl)
   │     end
   │
   └─ 7. Apply terminal colors (if enabled)
         vim.g.terminal_color_0 .. terminal_color_15
```

## Module Responsibilities

### `init.lua` — Public API

Exposes three functions:

| Function | Purpose |
| --- | --- |
| `setup(opts)` | Merges user options with defaults. Must be called before loading. |
| `load()` | Orchestrates the full load sequence above. |
| `palette()` | Returns the resolved color palette for external use. |

`setup()` and `load()` are intentionally separate so that plugin managers like lazy.nvim can call `setup()` at spec time and defer `load()` until `vim.cmd.colorscheme()`.

### `config.lua` — Configuration Management

Holds `defaults` and the resolved `options` table.

- `setup(opts)` — Deep-merges user options over defaults with `vim.tbl_deep_extend("force")`.
- `extend(opts)` — Merges additional options into already-resolved options. Useful for runtime reconfiguration.
- `options` — `nil` until `setup()` is called. `init.lua` checks this to auto-initialize if the user skips `setup()`.

### `palette.lua` — Color Definitions

A single `setup(opts)` function that:

1. Defines all color values as a flat table of hex strings.
2. Calls `opts.on_colors(colors)` to allow user mutations.
3. Returns the final colors table.

The palette is stateless — it builds fresh colors on every call. This ensures `on_colors` always operates on clean defaults.

### `util.lua` — Color Utilities

Pure functions for color math:

| Function | Signature | Description |
| --- | --- | --- |
| `hex_to_rgb` | `(hex) → r, g, b` | Converts `#rrggbb` to 0–255 RGB values |
| `rgb_to_hex` | `(r, g, b) → hex` | Converts RGB values to `#rrggbb` |
| `blend` | `(fg, bg, alpha) → hex` | Alpha-blends two colors (`1.0` = full fg, `0.0` = full bg) |
| `darken` | `(hex, amount, bg?) → hex` | Blends toward black (or custom bg) |
| `lighten` | `(hex, amount, fg?) → hex` | Blends toward white (or custom fg) |

These are available for use in group modules but are not exposed in the public API.

### `groups/init.lua` — Group Loader

Coordinates highlight group assembly:

1. **Core groups** — Always loads `base`, `treesitter`, and `semantic_tokens` by requiring each module and merging their `get()` results into a single table.
2. **Plugin detection** — `get_enabled(opts)` resolves which plugins are active based on `plugins.all`, `plugins.auto`, and per-plugin overrides.
3. **Plugin groups** — For each enabled plugin, `pcall(require, ...)` loads the module and merges its highlights. The `pcall` ensures a missing or broken plugin module never crashes the colorscheme.

**Detection priority** (per plugin):

```
plugins.<key> = true   → always enabled
plugins.<key> = false  → always disabled
plugins.all = true     → enabled
plugins.auto = true    → enabled if found in lazy.nvim's plugin list
otherwise              → disabled
```

Auto-detection queries `require("lazy.core.config").plugins[plugin_name]`, wrapped in `pcall` so it silently falls back when lazy.nvim is unavailable.

### `groups/*.lua` — Highlight Modules

Every highlight module (core and plugin) follows the same contract:

```lua
local M = {}

function M.get(c, opts)
  return {
    GroupName = { fg = c.blue, bg = c.bg, bold = true },
    -- ...
  }
end

return M
```

- **`c`** — The resolved palette table.
- **`opts`** — The resolved configuration options.
- **Returns** — A table mapping highlight group names to attribute tables.

This uniform interface means adding a new plugin module requires only:

1. Create `groups/<plugin-key>.lua` with a `get(c, opts)` function.
2. Add the lazy.nvim plugin name → group key mapping in `groups/init.lua :: M.plugins`.

## Key Design Decisions

### Flat palette over nested structure

All colors live in a single flat table (`c.blue`, `c.bg_dark`) rather than nested categories (`c.accent.blue`, `c.background.dark`). This keeps highlight definitions concise and reduces the verbosity of the most common operation — referencing a color.

### Hooks over subclassing

User customization uses `on_colors` and `on_highlights` callbacks that mutate tables in place, rather than requiring users to subclass or fork modules. This keeps the public API surface minimal while allowing arbitrary depth of customization.

### Stateless palette generation

`palette.setup()` builds a fresh table on every call rather than caching. This makes the system predictable — `on_colors` always starts from clean defaults — and avoids stale state bugs when the colorscheme is reloaded.

### `pcall` for plugin modules

Plugin group loading is wrapped in `pcall` so a broken or missing module file never prevents the rest of the colorscheme from loading. Core groups are loaded without `pcall` because they are required for a functional theme.

### Styles merged at the base level

The `styles` options (comments, keywords, etc.) are merged into base syntax groups using `vim.tbl_extend("force")` rather than being applied at the treesitter level. This ensures the attributes cascade properly from base Vim syntax to treesitter links without duplication.

## Adding a New Plugin

1. Create `lua/bearded-arc/groups/<key>.lua`:

```lua
local M = {}

function M.get(c, opts)
  return {
    PluginNormal = { fg = c.fg, bg = c.bg_float },
    PluginBorder = { fg = c.fg_gutter },
    -- ...
  }
end

return M
```

2. Register it in `lua/bearded-arc/groups/init.lua`:

```lua
M.plugins = {
  -- ...existing entries...
  ["plugin.nvim"] = "key",
}
```

3. The plugin is now auto-detected via lazy.nvim and can be toggled with `plugins.key = true/false`.
