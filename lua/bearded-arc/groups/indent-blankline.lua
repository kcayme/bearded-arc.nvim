local M = {}

function M.get(c, opts)
  return {
    IblIndent = { fg = "#263042", nocombine = true },
    IblScope = { fg = c.white, nocombine = true },
    IblWhitespace = { fg = "#263042", nocombine = true },
  }
end

return M
