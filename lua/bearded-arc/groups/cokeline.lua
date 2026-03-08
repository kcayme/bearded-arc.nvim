local M = {}

function M.get(c, opts)
  return {
    RoundedEdgeActive = { fg = c.blue, bg = c.bg_dark },
    RoundedInnerActive = { fg = c.bg_dark, bg = c.blue, bold = false },
    RoundedEdgeInactive = { fg = c.bg_dark, bg = c.bg_dark, bold = false },
    RoundedInnerInactive = { fg = c.fg, bg = c.bg_dark, bold = false },
    RoundedInnerActiveSecondary = { fg = c.bg_dark, bg = c.blue, bold = false, italic = true },
    RoundedInnerInactiveSecondary = { fg = c.fg, bg = c.bg_dark, bold = false, italic = true },
  }
end

return M
