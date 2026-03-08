local M = {}

function M.get(c, opts)
  return {
    TelescopeNormal = { bg = c.bg_float, fg = c.fg },
    TelescopeBorder = { fg = c.fg_dim, bg = c.bg_float },
    TelescopeTitle = { fg = c.blue, bold = true },
    TelescopePromptNormal = { bg = c.bg_float },
    TelescopePromptBorder = { fg = c.fg_dim, bg = c.bg_float },
    TelescopePromptTitle = { fg = c.blue, bold = true },
    TelescopePromptPrefix = { fg = c.blue },
    TelescopeResultsNormal = { bg = c.bg_float },
    TelescopeResultsBorder = { fg = c.fg_dim, bg = c.bg_float },
    TelescopeResultsTitle = { fg = c.blue, bold = true },
    TelescopePreviewNormal = { bg = c.bg },
    TelescopePreviewBorder = { fg = c.fg_dim, bg = c.bg },
    TelescopePreviewTitle = { fg = c.blue, bold = true },
    TelescopeSelection = { bg = c.bg_visual },
    TelescopeSelectionCaret = { fg = c.blue },
    TelescopeMatching = { fg = c.blue, bold = true },
  }
end

return M
