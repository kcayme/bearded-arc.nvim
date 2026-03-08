local M = {}

function M.get(c, opts)
  return {
    LeapBackdrop = { fg = c.fg_dim },
    LeapLabel = { fg = c.yellow, bold = true },
    LeapMatch = { fg = c.yellow, bold = true },
  }
end

return M
