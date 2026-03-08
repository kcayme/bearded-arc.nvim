local M = {}

function M.get(c, opts)
  return {
    BufferLineBackground = { fg = c.light_grey, bg = c.bg_dark },
    BufferlineIndicatorVisible = { fg = c.bg_dark, bg = c.bg_dark },
    BufferLineBufferSelected = { fg = c.fg, bg = c.bg },
    BufferLineBufferVisible = { fg = c.light_grey, bg = c.bg_dark },

    BufferLineError = { fg = c.light_grey, bg = c.bg_dark },
    BufferLineErrorDiagnostic = { fg = c.light_grey, bg = c.bg_dark },

    BufferLineCloseButton = { fg = c.light_grey, bg = c.bg_dark },
    BufferLineCloseButtonVisible = { fg = c.light_grey, bg = c.bg_dark },
    BufferLineCloseButtonSelected = { fg = c.red, bg = c.bg },

    BufferLineFill = { fg = c.fg_dim, bg = c.bg_darker },
    BufferlineIndicatorSelected = { fg = c.bg, bg = c.bg },

    BufferLineModified = { fg = c.red, bg = c.bg_dark },
    BufferLineModifiedVisible = { fg = c.red, bg = c.bg_dark },
    BufferLineModifiedSelected = { fg = c.green, bg = c.bg },

    BufferLineSeparator = { fg = c.bg_darker, bg = c.bg_dark },
    BufferLineSeparatorVisible = { fg = c.bg_darker, bg = c.bg_dark },
    BufferLineSeparatorSelected = { fg = c.bg_darker, bg = c.bg_darker },

    BufferLineTab = { fg = c.light_grey, bg = c.one_bg3 },
    BufferLineTabSelected = { fg = c.bg_dark, bg = c.nord_blue },
    BufferLineTabClose = { fg = c.red, bg = c.bg },

    BufferLineDevIconDefaultSelected = { bg = "none" },
    BufferLineDevIconDefaultInactive = { bg = "none" },

    BufferLineDuplicate = { fg = "NONE", bg = c.bg_dark },
    BufferLineDuplicateSelected = { fg = c.red, bg = c.bg },
    BufferLineDuplicateVisible = { fg = c.blue, bg = c.bg_dark },

    BufferLineRightCustomAreaText1 = { fg = c.fg },
    BufferLineRightCustomAreaText2 = { fg = c.red },
  }
end

return M
