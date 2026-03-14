# Contributing to bearded-arc.nvim

Thanks for your interest in contributing! This guide covers everything you need to get started.

## Getting Started

1. Fork the repository and clone your fork
2. Create a branch for your changes: `git checkout -b my-change`
3. Make your changes and test them in Neovim
4. Commit and push, then open a pull request

## Project Structure

```
lua/bearded-arc/
├── init.lua              # Public API (setup, load, palette)
├── config.lua            # Configuration defaults and merging
├── palette.lua           # Color palette (hex values)
├── util.lua              # Color math (blend, darken, lighten)
└── groups/
    ├── init.lua           # Plugin registry and loader
    ├── base.lua           # Core editor highlights
    ├── treesitter.lua     # Treesitter highlights
    ├── semantic_tokens.lua
    ├── git.lua
    └── <plugin>.lua       # One file per supported plugin
```

## Adding Plugin Support

This is the most common contribution. Each plugin gets its own file under `lua/bearded-arc/groups/`.

### 1. Create the highlight group file

Create `lua/bearded-arc/groups/<key>.lua` where `<key>` is a short name for the plugin:

```lua
local M = {}

function M.get(c, opts)
  return {
    PluginNormal = { fg = c.fg, bg = c.float_bg },
    PluginBorder = { fg = c.fg_dim },
    -- add more highlight groups...
  }
end

return M
```

- `c` is the color palette — use `c.blue`, `c.bg_float`, etc.
- `opts` is the resolved user configuration
- Return a table mapping highlight group names to their attributes (`fg`, `bg`, `bold`, `italic`, `underline`, `link`, etc.)

### 2. Register the plugin

Add an entry to `M.plugins` in `lua/bearded-arc/groups/init.lua`:

```lua
M.plugins = {
  -- ...existing entries (alphabetical order)...
  ["plugin-name.nvim"] = "key",
}
```

The left side is the plugin name as it appears in lazy.nvim. The right side is the filename you created (without `.lua`).

### 3. Finding highlight groups

To discover what highlight groups a plugin defines, you can:

- Check the plugin's source code (search for `vim.api.nvim_set_hl` or `highlight` definitions)
- Check the plugin's documentation
- Run `:Inspect` on a plugin's UI elements in Neovim
- Look at how other colorschemes handle the same plugin

### Tips

- Use semantic colors (`c.error`, `c.warning`, `c.info`, `c.hint`) for diagnostic-related groups
- Use `c.float_bg` and `c.fg_dim` for float windows and borders to stay consistent
- Use `c.bg_visual` for selection highlights
- Use `link` to reference existing groups when appropriate (e.g., `{ link = "Cursor" }`)
- Keep groups alphabetically sorted within the return table

## Available Palette Colors

### Backgrounds

`bg`, `bg_dark`, `bg_darker`, `bg_float`, `bg_popup`, `bg_visual`, `bg_status`, `bg_highlight`

### Foregrounds

`fg`, `fg_muted`, `fg_dim`, `fg_gutter`

### Accents

`blue`, `green`, `yellow`, `red`, `cyan`, `purple`, `magenta`, `orange`, `pink`, `lime`

### Semantic

`error`, `warning`, `info`, `hint`, `success`

### Special

`none` — use for transparent backgrounds

Computed at load time: `sidebar_bg`, `float_bg` (derived from transparency and style settings).

## Other Contributions

### Fixing or improving existing highlights

If a color feels off or a highlight group is missing from a supported plugin, open a PR with the fix. Screenshots or before/after comparisons are helpful.

### Core editor highlights

Core groups live in `base.lua`, `treesitter.lua`, `semantic_tokens.lua`, and `git.lua`. Changes here affect every user, so please include clear reasoning in your PR description.

### Color palette changes

Palette changes in `palette.lua` cascade across every highlight group. These are high-impact changes — open an issue to discuss before submitting a PR.

## Testing Your Changes

1. Point your Neovim config to your local fork:

```lua
-- lazy.nvim
{ dir = "~/path/to/bearded-arc.nvim", priority = 1000, opts = {} }
```

2. Reload the colorscheme without restarting Neovim:

```vim
:colorscheme bearded-arc
```

3. Inspect highlight groups under the cursor:

```vim
:Inspect
```

## Code Style

- No external dependencies — the colorscheme is self-contained
- Each plugin file exports a single `get(c, opts)` function
- Highlight groups are sorted alphabetically within each file
- Keep files focused: one plugin per file, no shared state between plugin modules

### No Hardcoded Hex Values

Never use literal hex values (e.g. `"#1a2b3c"`) in group files. All colors must come from the palette or be derived using `util`.

**Use palette colors directly:**

```lua
-- good
PluginNormal = { bg = c.bg_highlight }

-- bad
PluginNormal = { bg = "#263042" }
```

**Derive subtle tinted backgrounds with `util.darken`:**

```lua
local util = require("bearded-arc.util")

-- good — derives from palette, adapts if palette changes
DiffAdd = { bg = util.darken(c.green, 0.85, c.bg) }

-- bad
DiffAdd = { bg = "#192d24" }
```

`util` provides three helpers:

| Function | Description |
|---|---|
| `util.blend(fg, bg, alpha)` | Alpha-blend two colors (`alpha` 0.0–1.0, 1.0 = full `fg`) |
| `util.darken(hex, amount, bg)` | Blend `hex` toward `bg` (or black) by `amount` |
| `util.lighten(hex, amount, fg)` | Blend `hex` toward `fg` (or white) by `amount` |

For line-level diff/git backgrounds, `darken(color, 0.90, c.bg)` is a good starting point. Adjust the amount to taste — use `:Inspect` to verify the result looks right.

## Commit Messages

Follow conventional commit style:

```
feat: add support for <plugin-name>
fix: correct <plugin> border color
docs: update plugin list
```

## Questions?

Open an issue if something is unclear. We're happy to help!
