local M = {}

function M.get(c, opts)
  return {
    HopNextKey = { fg = c.red, bold = true },
    HopNextKey1 = { fg = c.cyan, bold = true },
    HopNextKey2 = { fg = c.blue, bold = true },
  }
end

return M
