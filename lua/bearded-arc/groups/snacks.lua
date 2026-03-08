local M = {}

function M.get(c, opts)
  return {
    SnacksNormal = { bg = c.bg_float, fg = c.fg },
    SnacksBorder = { fg = c.fg_dim, bg = c.bg_float },
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
    SnacksPickerList = { bg = c.bg_float },
    SnacksPickerListBorder = { fg = c.fg_dim, bg = c.bg_float },
    SnacksPickerListTitle = { fg = c.blue, bold = true },
    SnacksIndent = { fg = "#263042", nocombine = true },
    SnacksIndentScope = { fg = c.white, nocombine = true },
  }
end

return M
