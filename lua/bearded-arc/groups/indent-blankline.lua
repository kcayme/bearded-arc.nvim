local M = {}

function M.get(c, opts)
  return {
    IblIndent = { fg = c.bg_highlight, nocombine = true },
    IblScope = { fg = c.white, nocombine = true },
    IblWhitespace = { fg = c.bg_highlight, nocombine = true },
  }
end

return M
