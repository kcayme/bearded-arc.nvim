local M = {}

function M.get(c, opts)
  return {
    -- Dap
    DapBreakpoint = { fg = c.red },
    DapBreakpointCondition = { fg = c.yellow },
    DapBreakPointRejected = { fg = c.orange },
    DapLogPoint = { fg = c.cyan },
    DapStopped = { fg = c.pink },
    DapStoppedLine = { bg = c.one_bg },

    -- DapUI
    DAPUIScope = { fg = c.cyan },
    DAPUIType = { fg = c.dark_purple },
    DAPUIValue = { fg = c.cyan },
    DAPUIVariable = { fg = c.fg },
    DapUIModifiedValue = { fg = c.orange },
    DapUIDecoration = { fg = c.cyan },
    DapUIThread = { fg = c.green },
    DapUIStoppedThread = { fg = c.cyan },
    DapUISource = { fg = c.purple },
    DapUILineNumber = { fg = c.cyan },
    DapUIFloatBorder = { fg = c.cyan },

    DapUIWatchesEmpty = { fg = c.pink },
    DapUIWatchesValue = { fg = c.green },
    DapUIWatchesError = { fg = c.pink },

    DapUIBreakpointsPath = { fg = c.cyan },
    DapUIBreakpointsInfo = { fg = c.green },
    DapUIBreakPointsCurrentLine = { fg = c.green, bold = true },
    DapUIBreakpointsDisabledLine = { fg = c.fg_dim },

    DapUIStepOver = { fg = c.blue },
    DapUIStepOverNC = { fg = c.blue },
    DapUIStepInto = { fg = c.blue },
    DapUIStepIntoNC = { fg = c.blue },
    DapUIStepBack = { fg = c.blue },
    DapUIStepBackNC = { fg = c.blue },
    DapUIStepOut = { fg = c.blue },
    DapUIStepOutNC = { fg = c.blue },
    DapUIStop = { fg = c.red },
    DapUIStopNC = { fg = c.red },
    DapUIPlayPause = { fg = c.green },
    DapUIPlayPauseNC = { fg = c.green },
    DapUIRestart = { fg = c.green },
    DapUIRestartNC = { fg = c.green },
    DapUIUnavailable = { fg = c.fg_dim },
    DapUIUnavailableNC = { fg = c.fg_dim },

    -- DapView
    NvimDapViewMissingData = { fg = c.pink },
    NvimDapViewFileName = { fg = c.green },
    NvimDapViewLineNumber = { fg = c.cyan },
    NvimDapViewSeparator = { fg = c.light_grey },

    NvimDapViewThread = { fg = c.green },
    NvimDapViewThreadStopped = { fg = c.cyan },
    NvimDapViewThreadError = { fg = c.pink },

    NvimDapViewFrameCurrent = { fg = c.orange },

    NvimDapViewExceptionFilterEnabled = { fg = c.green },
    NvimDapViewExceptionFilterDisabled = { fg = c.light_grey },

    NvimDapViewTab = { fg = c.light_grey, bg = c.bg_dark },
    NvimDapViewTabSelected = { fg = c.fg, bg = c.bg },

    NvimDapViewControlNC = { fg = c.fg_dim },
    NvimDapViewControlPlay = { fg = c.green },
    NvimDapViewControlPause = { fg = c.orange },
    NvimDapViewControlStepInto = { fg = c.blue },
    NvimDapViewControlStepOut = { fg = c.blue },
    NvimDapViewControlStepOver = { fg = c.blue },
    NvimDapViewControlStepBack = { fg = c.blue },
    NvimDapViewControlRunLast = { fg = c.green },
    NvimDapViewControlTerminate = { fg = c.red },
    NvimDapViewControlDisconnect = { fg = c.red },

    NvimDapViewWatchExpr = { fg = c.green },
    NvimDapViewWatchMore = { fg = c.light_grey },
    NvimDapViewWatchError = { fg = c.pink },
    NvimDapViewWatchUpdated = { fg = c.orange },

    NvimDapViewBoolean = { link = "Boolean" },
    NvimDapViewString = { link = "String" },
    NvimDapViewNumber = { link = "Number" },
    NvimDapViewFloat = { link = "Float" },
    NvimDapViewFunction = { link = "Function" },
    NvimDapViewConstant = { link = "Constant" },
  }
end

return M
