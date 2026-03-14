local M = {}

function M.get(c, opts)
  return {
    SnacksNormal = { bg = c.float_bg, fg = c.fg },
    SnacksBorder = { fg = c.fg_dim, bg = c.float_bg },
    SnacksTitle = { fg = c.blue, bold = true },
    SnacksFooter = { fg = c.fg_dim },
    SnacksBackdrop = { bg = c.bg_darker },
    SnacksNotifierInfo = { fg = c.info },
    SnacksNotifierWarn = { fg = c.warning },
    SnacksNotifierError = { fg = c.error },
    SnacksNotifierDebug = { fg = c.fg_dim },
    SnacksNotifierTrace = { fg = c.purple },
    SnacksDashboardHeader = { fg = c.blue },
    SnacksDashboardIcon = { fg = c.blue },
    SnacksDashboardKey = { fg = c.yellow },
    SnacksDashboardDesc = { fg = c.fg_muted },
    SnacksDashboardFooter = { fg = c.fg_dim },
    SnacksPickerDir = { fg = c.fg_dim },
    SnacksPickerFile = { fg = c.fg },
    SnacksPickerMatch = { fg = c.blue, bold = true },
    SnacksPickerTitle = { fg = c.blue, bold = true },
    SnacksPickerBorder = { fg = c.fg_dim },
    SnacksPickerInput = { fg = c.fg },
    SnacksPickerInputBorder = { fg = c.blue },
    SnacksPickerInputTitle = { fg = c.blue, bold = true },
    SnacksPickerPreview = { bg = c.bg },
    SnacksPickerPreviewBorder = { fg = c.fg_dim },
    SnacksPickerPreviewTitle = { fg = c.blue, bold = true },
    SnacksPickerList = { bg = c.float_bg },
    SnacksPickerListBorder = { fg = c.fg_dim, bg = c.float_bg },
    SnacksPickerListTitle = { fg = c.blue, bold = true },
    SnacksIndent = { fg = c.bg_highlight, nocombine = true },
    SnacksIndentScope = { fg = c.white, nocombine = true },
  }
end

return M
