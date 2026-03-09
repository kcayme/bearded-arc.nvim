local M = {}

function M.get(c, opts)
  return {
    -- File types
    OilDir = { fg = c.blue, bold = true },
    OilDirIcon = { fg = c.blue },
    OilDirHidden = { fg = c.fg_dim },
    OilFile = { fg = c.fg },
    OilFileHidden = { fg = c.fg_dim },
    OilSocket = { fg = c.yellow },
    OilSocketHidden = { fg = c.fg_dim },
    OilLink = { fg = c.cyan },
    OilLinkHidden = { fg = c.fg_dim },
    OilLinkTarget = { fg = c.fg_muted },
    OilLinkTargetHidden = { fg = c.fg_dim },
    OilOrphanLink = { fg = c.red },
    OilOrphanLinkHidden = { fg = c.fg_dim },
    OilOrphanLinkTarget = { fg = c.red },
    OilOrphanLinkTargetHidden = { fg = c.fg_dim },
    OilEmpty = { fg = c.fg_dim },

    -- File operations
    OilCreate = { fg = c.green },
    OilDelete = { fg = c.red },
    OilMove = { fg = c.orange },
    OilCopy = { fg = c.hint },
    OilChange = { fg = c.yellow },
    OilRestore = { fg = c.green },
    OilPurge = { fg = c.red },
    OilTrash = { fg = c.red },
    OilTrashSourcePath = { fg = c.fg_muted },
  }
end

return M
