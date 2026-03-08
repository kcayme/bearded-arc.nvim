local M = {}

function M.get(c, opts)
  return {
    CodeActionMenuWarningMessageText = { fg = c.fg },
    CodeActionMenuWarningMessageBorder = { fg = c.red },
    CodeActionMenuMenuIndex = { fg = c.blue },
    CodeActionMenuMenuKind = { fg = c.green },
    CodeActionMenuMenuTitle = { fg = c.fg },
    CodeActionMenuMenuDisabled = { link = "Comment" },
    CodeActionMenuMenuSelection = { fg = c.blue },
    CodeActionMenuDetailsTitle = { fg = c.fg },
    CodeActionMenuDetailsLabel = { fg = c.yellow },
    CodeActionMenuDetailsPreferred = { fg = c.green },
    CodeActionMenuDetailsDisabled = { link = "Comment" },
    CodeActionMenuDetailsUndefined = { link = "Comment" },
  }
end

return M
