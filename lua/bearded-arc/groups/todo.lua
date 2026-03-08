local M = {}

function M.get(c, opts)
  return {
    TodoBgFix = { fg = c.bg_dark, bg = c.red, bold = true },
    TodoBgHack = { fg = c.bg_dark, bg = c.orange, bold = true },
    TodoBgNote = { fg = c.bg_dark, bg = c.fg, bold = true },
    TodoBgPerf = { fg = c.bg_dark, bg = c.purple, bold = true },
    TodoBgTest = { fg = c.bg_dark, bg = c.purple, bold = true },
    TodoBgTodo = { fg = c.bg_dark, bg = c.yellow, bold = true },
    TodoBgWarn = { fg = c.orange, bold = true },
    TodoFgFix = { fg = c.red },
    TodoFgHack = { fg = c.orange },
    TodoFgNote = { fg = c.fg },
    TodoFgPerf = { fg = c.purple },
    TodoFgTest = { fg = c.purple },
    TodoFgTodo = { fg = c.yellow },
    TodoFgWarn = { fg = c.orange },
    TodoSignFix = { link = "TodoFgFix" },
    TodoSignHack = { link = "TodoFgHack" },
    TodoSignNote = { link = "TodoFgNote" },
    TodoSignPerf = { link = "TodoFgPerf" },
    TodoSignTest = { link = "TodoFgTest" },
    TodoSignTodo = { link = "TodoFgTodo" },
    TodoSignWarn = { link = "TodoFgWarn" },
  }
end

return M
