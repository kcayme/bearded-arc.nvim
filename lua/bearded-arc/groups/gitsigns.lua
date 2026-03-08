local M = {}

function M.get(c, opts)
  return {
    GitSignsAdd = { fg = c.green },
    GitSignsChange = { fg = c.blue },
    GitSignsDelete = { fg = c.red },
    GitSignsCurrentLineBlame = { fg = c.fg_dim },
    GitSignsAddNr = { fg = c.green },
    GitSignsChangeNr = { fg = c.blue },
    GitSignsDeleteNr = { fg = c.red },
    GitSignsAddLn = { bg = "#162a24" },
    GitSignsChangeLn = { bg = "#162438" },
    GitSignsDeleteLn = { bg = "#28191a" },
  }
end

return M
