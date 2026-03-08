local M = {}

local function mix(fg, bg, pct)
  local function hex_to_rgb(hex)
    hex = hex:gsub("#", "")
    return tonumber(hex:sub(1, 2), 16), tonumber(hex:sub(3, 4), 16), tonumber(hex:sub(5, 6), 16)
  end

  local fr, fg_g, fb = hex_to_rgb(fg)
  local br, bg_g, bb = hex_to_rgb(bg)
  local t = pct / 100

  local r = math.floor(fr * (1 - t) + br * t + 0.5)
  local g = math.floor(fg_g * (1 - t) + bg_g * t + 0.5)
  local b = math.floor(fb * (1 - t) + bb * t + 0.5)

  return string.format("#%02x%02x%02x", r, g, b)
end

function M.get(c, opts)
  return {
    TinyInlineDiagnosticVirtualTextArrow = { fg = c.fg, bg = c.bg },

    TinyInlineDiagnosticVirtualTextError = { fg = c.red, bg = mix(c.red, c.bg, 75) },
    TinyInlineDiagnosticVirtualTextWarn = { fg = c.yellow, bg = mix(c.yellow, c.bg, 75) },
    TinyInlineDiagnosticVirtualTextInfo = { fg = c.green, bg = mix(c.green, c.bg, 75) },
    TinyInlineDiagnosticVirtualTextHint = { fg = c.purple, bg = mix(c.purple, c.bg, 75) },

    TinyInlineInvDiagnosticVirtualTextError = { fg = mix(c.red, c.bg, 75), bg = c.bg },
    TinyInlineInvDiagnosticVirtualTextWarn = { fg = mix(c.yellow, c.bg, 75), bg = c.bg },
    TinyInlineInvDiagnosticVirtualTextInfo = { fg = mix(c.green, c.bg, 75), bg = c.bg },
    TinyInlineInvDiagnosticVirtualTextHint = { fg = mix(c.purple, c.bg, 75), bg = c.bg },
  }
end

return M
