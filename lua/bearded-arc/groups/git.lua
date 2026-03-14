local util = require("bearded-arc.util")

local M = {}

function M.get(c, opts)
  return {
    diffOldFile = { fg = c.pink },
    diffNewFile = { fg = c.blue },
    DiffChangeDelete = { bg = util.darken(c.red, 0.85, c.bg), fg = c.red },
    DiffModified = { bg = util.darken(c.yellow, 0.85, c.bg), fg = c.orange },

    gitcommitOverflow = { fg = c.pink },
    gitcommitSummary = { fg = c.green },
    gitcommitComment = { fg = c.fg_dim },
    gitcommitUntracked = { fg = c.fg_dim },
    gitcommitDiscarded = { fg = c.fg_dim },
    gitcommitSelected = { fg = c.fg_dim },
    gitcommitHeader = { fg = c.purple },
    gitcommitSelectedType = { fg = c.blue },
    gitcommitUnmergedType = { fg = c.blue },
    gitcommitDiscardedType = { fg = c.blue },
    gitcommitBranch = { fg = c.orange, bold = true },
    gitcommitUntrackedFile = { fg = c.yellow },
    gitcommitUnmergedFile = { fg = c.pink, bold = true },
    gitcommitDiscardedFile = { fg = c.pink, bold = true },
    gitcommitSelectedFile = { fg = c.green, bold = true },
  }
end

return M
