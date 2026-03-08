local M = {}

function M.get(c, opts)
  return {
    NvimTreeNormal = { bg = c.bg_dark, fg = c.fg },
    NvimTreeNormalNC = { bg = c.bg_dark, fg = c.fg },
    NvimTreeWinSeparator = { fg = c.bg_dark, bg = c.bg_dark },
    NvimTreeFolderIcon = { fg = c.blue },
    NvimTreeFolderName = { fg = c.fg },
    NvimTreeOpenedFolderName = { fg = c.blue },
    NvimTreeRootFolder = { fg = c.blue, bold = true },
    NvimTreeSpecialFile = { fg = c.magenta },
    NvimTreeGitDirty = { fg = c.orange },
    NvimTreeGitNew = { fg = c.green },
    NvimTreeGitDeleted = { fg = c.red },
    NvimTreeGitStaged = { fg = c.green },
    NvimTreeIndentMarker = { fg = c.fg_dim },
    NvimTreeCursorLine = { bg = c.bg_highlight },
  }
end

return M
