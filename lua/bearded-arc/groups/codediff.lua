local util = require("bearded-arc.util")

local M = {}

function M.get(c, opts)
  return {
    -- Core diff highlights
    CodeDiffCharDelete = { bg = util.darken(c.red, 0.75, c.bg) },
    CodeDiffCharInsert = { bg = util.darken(c.green, 0.75, c.bg) },
    CodeDiffCharMove = { bg = util.darken(c.blue, 0.75, c.bg) },
    CodeDiffLineDelete = { bg = util.darken(c.red, 0.90, c.bg) },
    CodeDiffLineInsert = { bg = util.darken(c.green, 0.90, c.bg) },
    CodeDiffLineMove = { bg = util.darken(c.blue, 0.90, c.bg) },
    CodeDiffMoveFrom = { bg = util.darken(c.purple, 0.90, c.bg) },
    CodeDiffMoveTo = { bg = util.darken(c.cyan, 0.90, c.bg) },

    -- UI & layout
    CodeDiffExplorerSelected = { bg = c.bg_highlight, fg = c.fg },
    CodeDiffFiller = { bg = c.bg_dark },

    -- History
    CodeDiffHistoryTitle = { fg = c.blue, bold = true },

    -- File status in explorer
    CodeDiffStatusAdded = { fg = c.green },
    CodeDiffStatusConflict = { fg = c.red, bold = true },
    CodeDiffStatusDeleted = { fg = c.red },
    CodeDiffStatusModified = { fg = c.yellow },
    CodeDiffStatusRenamed = { fg = c.cyan },
    CodeDiffStatusUntracked = { fg = c.fg_muted },

    -- Conflict resolution signs
    CodeDiffConflictSign = { fg = c.red },
    CodeDiffConflictSignAccepted = { fg = c.green },
    CodeDiffConflictSignRejected = { fg = c.red },
    CodeDiffConflictSignResolved = { fg = c.fg_dim },
  }
end

return M
