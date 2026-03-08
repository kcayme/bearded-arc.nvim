# Highlights

bearded-arc.nvim defines highlight groups across three core modules that are always loaded, plus optional plugin-specific modules.

## Core Modules

### Base (`groups/base.lua`)

Editor UI and traditional Vim syntax groups.

#### Editor UI

| Group | Foreground | Background | Notes |
| --- | --- | --- | --- |
| `Normal` | `fg` | `bg` | Transparent: `NONE` bg |
| `NormalFloat` | `fg` | `bg_float` | Transparent: `NONE` bg |
| `NormalNC` | `fg` | `bg` | `dim_inactive`: `bg_dark` |
| `Cursor` | `bg` | `fg` | |
| `CursorLine` | | `bg_highlight` | |
| `CursorLineNr` | `yellow` | | |
| `LineNr` | `fg_gutter` | | |
| `SignColumn` | `fg_gutter` | `bg` | Transparent: `NONE` bg |
| `WinSeparator` | `bg_visual` | | |
| `StatusLine` | `fg` | `bg_status` | |
| `StatusLineNC` | `fg_dim` | `bg_dark` | |
| `TabLine` | `fg_dim` | `bg_dark` | |
| `TabLineFill` | | `bg_darker` | |
| `TabLineSel` | `fg` | `bg` | |
| `Pmenu` | `fg` | `bg_popup` | |
| `PmenuSel` | | `bg_visual` | |
| `FloatBorder` | `fg_gutter` | `bg_float` | |
| `FloatTitle` | `blue` | `bg_float` | |
| `Search` | `bg` | `cyan` | |
| `IncSearch` | `bg` | `cyan` | |
| `CurSearch` | `bg` | `sun` | Bold |
| `Visual` | | `bg_visual` | |
| `MatchParen` | `orange` | | Bold, underline |
| `Title` | `blue` | | Bold |
| `SpellBad` | | | Undercurl, sp=`error` |
| `SpellCap` | | | Undercurl, sp=`warning` |

#### Syntax

| Group | Color | Notes |
| --- | --- | --- |
| `Comment` | `fg_dim` | Styled via `styles.comments` |
| `Constant` | `red` | |
| `String` | `green` | Styled via `styles.strings` |
| `Number` / `Boolean` / `Float` | `red` | |
| `Identifier` | `pink` | Styled via `styles.variables` |
| `Function` | `blue` | Styled via `styles.functions` |
| `Statement` | `yellow` | |
| `Keyword` / `Conditional` / `Repeat` / `Exception` | `yellow` | Styled via `styles.keywords` |
| `Operator` | `yellow` | |
| `Type` | `purple` | |
| `StorageClass` | `cyan` | |
| `Structure` / `Typedef` | `purple` | |
| `Special` / `SpecialChar` | `pink` | |
| `Tag` | `blue` | |
| `Delimiter` | `fg_muted` | |
| `Todo` | `bg` on `yellow` | Bold |

#### Diagnostics

| Group | Color | Style |
| --- | --- | --- |
| `DiagnosticError` | `error` | |
| `DiagnosticWarn` | `warning` | |
| `DiagnosticInfo` | `info` | |
| `DiagnosticHint` | `hint` | |
| `DiagnosticOk` | `success` | |
| `DiagnosticUnderline*` | | Undercurl with matching `sp` |
| `DiagnosticVirtualText*` | Matching color | `bg_dark` background |
| `DiagnosticSign*` | Matching color | |

#### Diff

| Group | Color |
| --- | --- |
| `DiffAdd` | bg `#192d24` |
| `DiffChange` | bg `#242833` |
| `DiffDelete` | bg `#351c22` |
| `DiffText` | bg `#334559` |
| `diffAdded` | fg `green` |
| `diffChanged` | fg `yellow` |
| `diffRemoved` | fg `red` |

### Treesitter (`groups/treesitter.lua`)

Full Treesitter scope coverage. Key mappings:

| Scope | Color | Notes |
| --- | --- | --- |
| `@variable` | `fg` | |
| `@variable.builtin` | `pink` | Italic |
| `@variable.parameter` | `magenta` | |
| `@variable.member` | `pink` | |
| `@constant` | `red` | |
| `@constant.builtin` | `red` | Bold |
| `@string` | `green` | |
| `@string.escape` | `cyan` | Bold |
| `@string.regex` | `cyan` | |
| `@string.special.url` | `blue` | Underline |
| `@function` | `blue` | |
| `@function.builtin` | `blue` | |
| `@function.call` | `blue` | |
| `@function.method` | `blue` | |
| `@keyword` | `yellow` | |
| `@keyword.function` | `cyan` | |
| `@keyword.return` | `yellow` | |
| `@keyword.import` | `yellow` | |
| `@keyword.conditional` | `yellow` | |
| `@keyword.repeat` | `yellow` | |
| `@keyword.exception` | `yellow` | |
| `@keyword.operator` | `yellow` | |
| `@type` | `purple` | |
| `@type.builtin` | `purple` | Italic |
| `@property` | `pink` | |
| `@attribute` | `cyan` | |
| `@tag` | `blue` | |
| `@tag.attribute` | `magenta` | |
| `@tag.delimiter` | `fg_muted` | |
| `@module` | `fg_muted` | |
| `@punctuation.bracket` | `fg_muted` | |
| `@punctuation.delimiter` | `fg_muted` | |
| `@comment.todo` | `bg` on `yellow` | Bold |
| `@comment.error` | `bg` on `red` | Bold |
| `@comment.warning` | `bg` on `orange` | Bold |
| `@comment.note` | `bg` on `blue` | Bold |
| `@markup.heading` | `blue` | Bold |
| `@markup.bold` | | Bold |
| `@markup.italic` | | Italic |
| `@markup.link` | `blue` | |
| `@markup.link.url` | `blue` | Underline |

### LSP Semantic Tokens (`groups/semantic_tokens.lua`)

| Token | Color | Notes |
| --- | --- | --- |
| `@lsp.type.namespace` | `fg_muted` | |
| `@lsp.type.class` | `purple` | |
| `@lsp.type.interface` | `purple` | Italic |
| `@lsp.type.struct` | `purple` | |
| `@lsp.type.enum` | `purple` | |
| `@lsp.type.enumMember` | `red` | |
| `@lsp.type.function` | `blue` | |
| `@lsp.type.method` | `blue` | |
| `@lsp.type.variable` | `fg` | |
| `@lsp.type.property` | `pink` | |
| `@lsp.type.parameter` | `magenta` | |
| `@lsp.type.decorator` | `cyan` | |
| `@lsp.type.keyword` | `yellow` | |
| `@lsp.mod.deprecated` | | Strikethrough |

## Overriding Highlights

Use the `on_highlights` hook to modify any group after generation:

```lua
require("bearded-arc").setup({
  on_highlights = function(hl, c)
    -- change cursor line to a custom color
    hl.CursorLine = { bg = "#2a3445" }

    -- make all types bold
    hl.Type = { fg = c.purple, bold = true }
    hl["@type"] = { fg = c.purple, bold = true }

    -- add a custom highlight group
    hl.MyCustomGroup = { fg = c.cyan, italic = true }
  end,
})
```
