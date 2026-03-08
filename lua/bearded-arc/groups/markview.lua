local M = {}

function M.get(c, opts)
  return {
    ["@markup.heading.1.markdown"] = { fg = c.red, bold = true },
    ["@markup.heading.2.markdown"] = { fg = c.orange, bold = true },
    ["@markup.heading.3.markdown"] = { fg = c.yellow, bold = true },
    ["@markup.heading.4.markdown"] = { fg = c.green, bold = true },
    ["@markup.heading.5.markdown"] = { fg = c.blue, bold = true },
    ["@markup.heading.6.markdown"] = { fg = c.purple, bold = true },
  }
end

return M
