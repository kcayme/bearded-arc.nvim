local M = {}

function M.get(c, opts)
  return {
    FlashBackdrop = { fg = c.fg_dim },
    FlashLabel = { bg = c.bg, fg = c.cyan, italic = true, bold = true },
    FlashMatch = { bg = c.bg, fg = c.yellow, italic = true, bold = true },
    FlashCurrent = { bg = c.bg, fg = c.orange },
  }
end

return M
