local M = {}

function M.get(c, opts)
  return {
    NotifyERRORBorder = { fg = c.red },
    NotifyERRORIcon = { fg = c.red },
    NotifyERRORTitle = { fg = c.red },
    NotifyWARNBorder = { fg = c.orange },
    NotifyWARNIcon = { fg = c.orange },
    NotifyWARNTitle = { fg = c.orange },
    NotifyINFOBorder = { fg = c.green },
    NotifyINFOIcon = { fg = c.green },
    NotifyINFOTitle = { fg = c.green },
    NotifyDEBUGBorder = { fg = c.fg_dim },
    NotifyDEBUGIcon = { fg = c.fg_dim },
    NotifyDEBUGTitle = { fg = c.fg_dim },
    NotifyTRACEBorder = { fg = c.purple },
    NotifyTRACEIcon = { fg = c.purple },
    NotifyTRACETitle = { fg = c.purple },
  }
end

return M
