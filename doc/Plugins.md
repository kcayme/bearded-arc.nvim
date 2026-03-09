# Plugins

bearded-arc.nvim ships with highlight groups for 28 popular plugins and can auto-detect which ones you have installed.

## Auto-Detection

When using [lazy.nvim](https://github.com/folke/lazy.nvim), plugins are detected automatically through `require("lazy.core.config").plugins`. This is the default behavior.

| Scenario | `all` default | `auto` default | Result |
| --- | --- | --- | --- |
| lazy.nvim loaded | `false` | `true` | Only detected plugins |
| lazy.nvim not loaded | `true` | `true` | All plugin highlights loaded |

You can override per-plugin with `plugins.<key> = true` or `false`, which takes priority over both `all` and `auto`.

## Supported Plugins

### [aerial.nvim](https://github.com/stevearc/aerial.nvim)

Key: `aerial`

Code outline: UI elements (normal, float, guide, line, private/protected), 26 symbol kind highlights, and 26 matching icon highlights with colors consistent with blink.cmp kind groups (59 groups).

### [atone.nvim](https://github.com/XXiaoA/atone.nvim)

Key: `atone`

Undo tree: sequence numbers, brackets, and current node highlight (3 groups).

### [blink.cmp](https://github.com/Saghen/blink.cmp)

Key: `blink`

Completion menu, borders, selection, kind icons (35 groups). Covers `BlinkCmpMenu`, `BlinkCmpLabel`, `BlinkCmpKind*`, and ghost text.

### [bufferline.nvim](https://github.com/akinsho/bufferline.nvim)

Key: `bufferline`

Tab/buffer line: background, selected, visible, close buttons, modified indicators, separators, tabs, duplicates, and dev icons (30 groups).

### [code-action-menu.nvim](https://github.com/weilbith/nvim-code-action-menu)

Key: `codeactionmenu`

Code action menu: warning messages, menu index, kind, title, selection, details, preferred, and disabled states (12 groups).

### [cokeline.nvim](https://github.com/willothy/nvim-cokeline)

Key: `cokeline`

Buffer line active/inactive edges and inner styling.

### [flash.nvim](https://github.com/folke/flash.nvim)

Key: `flash`

Backdrop, label, match, and current match highlights.

### [fzf-lua](https://github.com/ibhagwan/fzf-lua)

Key: `fzf`

Fuzzy finder normal, border, title, preview, cursor line, search, and header.

### [gitsigns.nvim](https://github.com/lewis6991/gitsigns.nvim)

Key: `gitsigns`

Sign column indicators for add, change, and delete with line and line number variants.

### [grug-far.nvim](https://github.com/MagicDuck/grug-far.nvim)

Key: `grug-far`

Find and replace: result match, added, and removed highlights (3 groups).

### [hop.nvim](https://github.com/smoka7/hop.nvim)

Key: `hop`

Motion labels: primary, secondary, and tertiary key highlights (3 groups).

### [indent-blankline.nvim](https://github.com/lukas-reineke/indent-blankline.nvim)

Key: `indent-blankline`

Indent guides, scope, and whitespace characters.

### [lazy.nvim](https://github.com/folke/lazy.nvim)

Key: `lazy`

Plugin manager UI: buttons, headers, comments, commits, properties, and progress bar (18 groups).

### [leap.nvim](https://github.com/ggandor/leap.nvim)

Key: `leap`

Motion labels: backdrop, label, and match highlights (3 groups).

### [markview.nvim](https://github.com/OXY2DEV/markview.nvim)

Key: `markview`

Markdown heading colors for h1-h6 (6 groups).

### [mason.nvim](https://github.com/williamboman/mason.nvim)

Key: `mason`

LSP installer: header, highlights, highlight blocks, muted text, and muted blocks (7 groups).

### [nvim-cmp](https://github.com/hrsh7th/nvim-cmp)

Key: `cmp`

Completion menu, documentation, borders, selection, and 30+ item kind highlights including Copilot, Codeium, TabNine, and SuperMaven (42 groups).

### [nvim-dap](https://github.com/mfussenegger/nvim-dap)

Key: `dap`

Debug adapter: breakpoints, dap-ui scopes/variables/watches/threads/controls, and dap-view tabs/threads/controls/watches (82 groups).

### [nvim-notify](https://github.com/rcarriga/nvim-notify)

Key: `notify`

Notification popups: ERROR, WARN, INFO, DEBUG, and TRACE borders, icons, and titles (15 groups).

### [nvim-tree.lua](https://github.com/nvim-tree/nvim-tree.lua)

Key: `nvim-tree`

File explorer: normal, folder icons, git status, root folder, and cursor line (12 groups).

### [oil.nvim](https://github.com/stevearc/oil.nvim)

Key: `oil`

File explorer: directories, files, links, orphan links, sockets, hidden items, and file operations (create, delete, move, copy, change, restore, purge, trash) (31 groups).

### [render-markdown.nvim](https://github.com/MeanderingProgrammer/render-markdown.nvim)

Key: `render-markdown`

Markdown heading colors h1-h6 and subtle blended heading backgrounds (12 groups).

### [snacks.nvim](https://github.com/folke/snacks.nvim)

Key: `snacks`

Normal, border, title, notifier, dashboard, and picker highlights (36 groups).

### [telescope.nvim](https://github.com/nvim-telescope/telescope.nvim)

Key: `telescope`

Fuzzy finder: normal, border, title, prompt, results, preview, and selection (13 groups).

### [tiny-inline-diagnostic.nvim](https://github.com/rachartier/tiny-inline-diagnostic.nvim)

Key: `tiny-inline-diagnostic`

Inline diagnostics: virtual text with blended backgrounds for error, warn, info, and hint, plus inverted variants (9 groups).

### [todo-comments.nvim](https://github.com/folke/todo-comments.nvim)

Key: `todo`

TODO/FIXME/HACK/NOTE/PERF/TEST/WARN highlights with background, foreground, and sign variants (21 groups).

### [trouble.nvim](https://github.com/folke/trouble.nvim)

Key: `trouble`

Diagnostics list: normal, text, count, and diagnostic-colored icons (10 groups).

### [which-key.nvim](https://github.com/folke/which-key.nvim)

Key: `which-key`

Key popup: keys, groups, descriptions, separators, float, border, and icon colors (19 groups).

## Configuration Examples

Load all plugin highlights regardless of detection:

```lua
plugins = {
  all = true,
}
```

Rely on auto-detection but force-enable telescope:

```lua
plugins = {
  auto = true,
  telescope = true,
}
```

Disable a specific plugin:

```lua
plugins = {
  gitsigns = false,
}
```

Disable auto-detection and only load specific plugins:

```lua
plugins = {
  all = false,
  auto = false,
  telescope = true,
  gitsigns = true,
}
```
