local M = {}

function M.get(c, opts)
  return {
    LazyButton = { bg = c.bg_popup, fg = c.fg },
    LazyButtonActive = { bg = c.blue, fg = c.bg },
    LazyH1 = { bg = c.blue, fg = c.bg, bold = true },
    LazyH2 = { fg = c.blue, bold = true },
    LazyComment = { fg = c.fg_dim },
    LazyCommit = { fg = c.green },
    LazyCommitType = { fg = c.cyan },
    LazyDimmed = { fg = c.fg_dim },
    LazyProp = { fg = c.purple },
    LazyReasonPlugin = { fg = c.yellow },
    LazyReasonEvent = { fg = c.orange },
    LazyReasonKeys = { fg = c.magenta },
    LazyReasonCmd = { fg = c.green },
    LazySpecial = { fg = c.blue },
    LazyProgressDone = { fg = c.green },
    LazyProgressTodo = { fg = c.fg_dim },
  }
end

return M
