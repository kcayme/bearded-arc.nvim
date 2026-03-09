local M = {}

function M.get(c, opts)
  return {
    AtoneSeq = { fg = c.orange },
    AtoneSeqBracket = { fg = c.fg_dim },
    AtoneCurrentNode = { fg = c.blue, bold = true },
  }
end

return M
