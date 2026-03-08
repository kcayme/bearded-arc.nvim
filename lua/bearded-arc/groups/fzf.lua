local M = {}

function M.get(c, opts)
  return {
    FzfLuaNormal = { bg = c.bg_float, fg = c.fg },
    FzfLuaBorder = { fg = c.fg_dim, bg = c.bg_float },
    FzfLuaTitle = { fg = c.blue, bold = true },
    FzfLuaPreviewNormal = { bg = c.bg },
    FzfLuaPreviewBorder = { fg = c.fg_dim, bg = c.bg },
    FzfLuaCursorLine = { bg = c.bg_highlight },
    FzfLuaSearch = { fg = c.bg, bg = c.cyan },
    FzfLuaHeaderText = { fg = c.blue },
    FzfLuaHeaderBind = { fg = c.yellow },
    FzfLuaFzfMatch = { fg = c.blue },
  }
end

return M
