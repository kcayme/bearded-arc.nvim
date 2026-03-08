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
    ["@markup.heading.1.markdown"] = { fg = c.red, bold = true },
    ["@markup.heading.2.markdown"] = { fg = c.orange, bold = true },
    ["@markup.heading.3.markdown"] = { fg = c.yellow, bold = true },
    ["@markup.heading.4.markdown"] = { fg = c.green, bold = true },
    ["@markup.heading.5.markdown"] = { fg = c.blue, bold = true },
    ["@markup.heading.6.markdown"] = { fg = c.purple, bold = true },

    RenderMarkdownH1Bg = { bg = mix(c.red, c.bg, 90) },
    RenderMarkdownH2Bg = { bg = mix(c.orange, c.bg, 90) },
    RenderMarkdownH3Bg = { bg = mix(c.yellow, c.bg, 90) },
    RenderMarkdownH4Bg = { bg = mix(c.green, c.bg, 90) },
    RenderMarkdownH5Bg = { bg = mix(c.blue, c.bg, 90) },
    RenderMarkdownH6Bg = { bg = mix(c.purple, c.bg, 90) },
  }
end

return M
