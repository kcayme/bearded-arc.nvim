local M = {}

function M.get(c, opts)
  return {
    TroubleNormal = { bg = c.bg_float, fg = c.fg },
    TroubleText = { fg = c.fg },
    TroubleCount = { fg = c.purple, bg = c.bg_popup },
    TroubleIndent = { fg = c.fg_dim },
    TroubleFoldIcon = { fg = c.fg_dim },
    TroubleLocation = { fg = c.fg_dim },
    TroubleIconError = { fg = c.error },
    TroubleIconWarning = { fg = c.warning },
    TroubleIconInformation = { fg = c.info },
    TroubleIconHint = { fg = c.hint },
  }
end

return M
