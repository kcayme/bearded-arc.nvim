local M = {}

function M.hex_to_rgb(hex)
  hex = hex:gsub("^#", "")
  return tonumber(hex:sub(1, 2), 16), tonumber(hex:sub(3, 4), 16), tonumber(hex:sub(5, 6), 16)
end

function M.rgb_to_hex(r, g, b)
  return string.format("#%02x%02x%02x", math.floor(r + 0.5), math.floor(g + 0.5), math.floor(b + 0.5))
end

function M.blend(fg, bg, alpha)
  local fr, fg_, fb = M.hex_to_rgb(fg)
  local br, bg_, bb = M.hex_to_rgb(bg)
  local r = alpha * fr + (1 - alpha) * br
  local g = alpha * fg_ + (1 - alpha) * bg_
  local b = alpha * fb + (1 - alpha) * bb
  return M.rgb_to_hex(math.min(255, math.max(0, r)), math.min(255, math.max(0, g)), math.min(255, math.max(0, b)))
end

function M.darken(hex, amount, bg)
  return M.blend(hex, bg or "#000000", 1 - amount)
end

function M.lighten(hex, amount, fg)
  return M.blend(hex, fg or "#ffffff", 1 - amount)
end

return M
