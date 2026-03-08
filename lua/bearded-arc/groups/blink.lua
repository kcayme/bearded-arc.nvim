local M = {}

function M.get(c, opts)
  return {
    BlinkCmpMenu = { bg = c.bg_float, fg = c.fg },
    BlinkCmpMenuBorder = { fg = c.fg_dim, bg = c.bg_float },
    BlinkCmpMenuSelection = { bg = c.bg_visual },
    BlinkCmpLabel = { fg = c.fg },
    BlinkCmpLabelMatch = { fg = c.blue, bold = true },
    BlinkCmpLabelDeprecated = { fg = c.fg_dim, strikethrough = true },
    BlinkCmpKind = { fg = c.purple },
    BlinkCmpKindFunction = { fg = c.blue },
    BlinkCmpKindMethod = { fg = c.blue },
    BlinkCmpKindVariable = { fg = c.pink },
    BlinkCmpKindKeyword = { fg = c.yellow },
    BlinkCmpKindText = { fg = c.fg_muted },
    BlinkCmpKindField = { fg = c.orange },
    BlinkCmpKindSnippet = { fg = c.magenta },
    BlinkCmpKindClass = { fg = c.purple },
    BlinkCmpKindInterface = { fg = c.purple },
    BlinkCmpKindModule = { fg = c.blue },
    BlinkCmpKindProperty = { fg = c.orange },
    BlinkCmpKindUnit = { fg = c.red },
    BlinkCmpKindValue = { fg = c.red },
    BlinkCmpKindEnum = { fg = c.purple },
    BlinkCmpKindConstant = { fg = c.red },
    BlinkCmpKindStruct = { fg = c.purple },
    BlinkCmpKindType = { fg = c.purple },
    BlinkCmpGhostText = { fg = c.fg_dim },
    BlinkCmpDoc = { bg = c.bg_float },
    BlinkCmpDocBorder = { fg = c.fg_dim, bg = c.bg_float },
  }
end

return M
