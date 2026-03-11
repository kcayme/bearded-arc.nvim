# Plugins

bearded-arc.nvim ships with highlight groups for 29 popular plugins and can auto-detect which ones you have installed.

## Auto-Detection

When using [lazy.nvim](https://github.com/folke/lazy.nvim), plugins are detected automatically through `require("lazy.core.config").plugins`. This is the default behavior.

| Scenario | `all` default | `auto` default | Result |
| --- | --- | --- | --- |
| lazy.nvim loaded | `false` | `true` | Only detected plugins |
| lazy.nvim not loaded | `true` | `true` | All plugin highlights loaded |

You can override per-plugin with `plugins.<key> = true` or `false`, which takes priority over both `all` and `auto`.

## Supported Plugins

- [aerial.nvim](https://github.com/stevearc/aerial.nvim) — `aerial` — Code outline, symbol kinds, and icon highlights (59 groups)
- [atone.nvim](https://github.com/XXiaoA/atone.nvim) — `atone` — Undo tree (3 groups)
- [blink.cmp](https://github.com/Saghen/blink.cmp) — `blink` — Completion menu, borders, selection, and kind icons (35 groups)
- [bufferline.nvim](https://github.com/akinsho/bufferline.nvim) — `bufferline` — Tab/buffer line, separators, and indicators (30 groups)
- [code-action-menu.nvim](https://github.com/weilbith/nvim-code-action-menu) — `codeactionmenu` — Code action menu and states (12 groups)
- [cokeline.nvim](https://github.com/willothy/nvim-cokeline) — `cokeline` — Buffer line active/inactive styling
- [fff.nvim](https://github.com/kcayme/fff.nvim) — `fff` — File manager selection and git status indicators (20 groups)
- [flash.nvim](https://github.com/folke/flash.nvim) — `flash` — Backdrop, label, and match highlights
- [fzf-lua](https://github.com/ibhagwan/fzf-lua) — `fzf` — Fuzzy finder, border, title, and preview
- [gitsigns.nvim](https://github.com/lewis6991/gitsigns.nvim) — `gitsigns` — Sign column add/change/delete indicators
- [grug-far.nvim](https://github.com/MagicDuck/grug-far.nvim) — `grug-far` — Find and replace matches (3 groups)
- [hop.nvim](https://github.com/smoka7/hop.nvim) — `hop` — Motion label highlights (3 groups)
- [indent-blankline.nvim](https://github.com/lukas-reineke/indent-blankline.nvim) — `indent-blankline` — Indent guides and scope
- [lazy.nvim](https://github.com/folke/lazy.nvim) — `lazy` — Plugin manager UI (18 groups)
- [leap.nvim](https://github.com/ggandor/leap.nvim) — `leap` — Motion labels and match highlights (3 groups)
- [markview.nvim](https://github.com/OXY2DEV/markview.nvim) — `markview` — Markdown heading colors h1–h6 (6 groups)
- [mason.nvim](https://github.com/williamboman/mason.nvim) — `mason` — LSP installer UI (7 groups)
- [noice.nvim](https://github.com/folke/noice.nvim) — `noice` — Cmdline, popupmenu, notifications, and LSP progress (37 groups)
- [nvim-cmp](https://github.com/hrsh7th/nvim-cmp) — `cmp` — Completion menu, borders, and item kind highlights (42 groups)
- [nvim-dap](https://github.com/mfussenegger/nvim-dap) — `dap` — Debug adapter, breakpoints, and dap-ui/dap-view (82 groups)
- [nvim-notify](https://github.com/rcarriga/nvim-notify) — `notify` — Notification popups by level (15 groups)
- [nvim-tree.lua](https://github.com/nvim-tree/nvim-tree.lua) — `nvim-tree` — File explorer, folder icons, and git status (12 groups)
- [oil.nvim](https://github.com/stevearc/oil.nvim) — `oil` — File explorer and file operations (31 groups)
- [render-markdown.nvim](https://github.com/MeanderingProgrammer/render-markdown.nvim) — `render-markdown` — Markdown headings and blended backgrounds (12 groups)
- [snacks.nvim](https://github.com/folke/snacks.nvim) — `snacks` — Notifier, dashboard, and picker highlights (36 groups)
- [telescope.nvim](https://github.com/nvim-telescope/telescope.nvim) — `telescope` — Fuzzy finder, prompt, results, and preview (13 groups)
- [tiny-inline-diagnostic.nvim](https://github.com/rachartier/tiny-inline-diagnostic.nvim) — `tiny-inline-diagnostic` — Inline diagnostics with blended backgrounds (9 groups)
- [todo-comments.nvim](https://github.com/folke/todo-comments.nvim) — `todo` — TODO/FIXME/HACK/NOTE highlights and signs (21 groups)
- [trouble.nvim](https://github.com/folke/trouble.nvim) — `trouble` — Diagnostics list and icons (10 groups)
- [which-key.nvim](https://github.com/folke/which-key.nvim) — `which-key` — Key popup, groups, and descriptions (19 groups)

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
