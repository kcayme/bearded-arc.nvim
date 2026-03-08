local M = {}

function M.get(c, opts)
  return {
    CmpItemAbbr = { fg = c.fg },
    CmpItemAbbrMatch = { fg = c.blue, bold = true },
    CmpDoc = { bg = c.bg_dark },
    CmpDocBorder = { fg = c.fg_dim, bg = c.bg_dark },
    CmpPmenu = { bg = c.bg_dark },
    CmpSel = { link = "PmenuSel", bold = true },
    CmpBorder = { fg = c.fg_dim },

    CmpItemKindConstant = { fg = c.red },
    CmpItemKindFunction = { fg = c.blue },
    CmpItemKindIdentifier = { fg = c.pink },
    CmpItemKindField = { fg = c.orange },
    CmpItemKindVariable = { fg = c.pink },
    CmpItemKindSnippet = { fg = c.magenta },
    CmpItemKindText = { fg = c.fg_muted },
    CmpItemKindStructure = { fg = c.purple },
    CmpItemKindType = { fg = c.purple },
    CmpItemKindKeyword = { fg = c.yellow },
    CmpItemKindMethod = { fg = c.blue },
    CmpItemKindConstructor = { fg = c.blue },
    CmpItemKindFolder = { fg = c.fg },
    CmpItemKindModule = { fg = c.blue },
    CmpItemKindProperty = { fg = c.orange },
    CmpItemKindEnum = { fg = c.purple },
    CmpItemKindUnit = { fg = c.red },
    CmpItemKindClass = { fg = c.purple },
    CmpItemKindFile = { fg = c.fg },
    CmpItemKindInterface = { fg = c.purple },
    CmpItemKindColor = { fg = c.fg },
    CmpItemKindReference = { fg = c.fg_muted },
    CmpItemKindEnumMember = { fg = c.purple },
    CmpItemKindStruct = { fg = c.purple },
    CmpItemKindValue = { fg = c.red },
    CmpItemKindEvent = { fg = c.yellow },
    CmpItemKindOperator = { fg = c.yellow },
    CmpItemKindTypeParameter = { fg = c.pink },
    CmpItemKindCopilot = { fg = c.green },
    CmpItemKindCodeium = { fg = c.green },
    CmpItemKindTabNine = { fg = c.pink },
    CmpItemKindSuperMaven = { fg = c.yellow },
  }
end

return M
