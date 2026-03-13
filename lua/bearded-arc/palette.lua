local M = {}

function M.setup(opts)
  local colors = {
    none = "NONE",

    -- Backgrounds (Arc base: #1c2433)
    bg = "#1c2433",
    bg_dark = "#171e2b",
    bg_darker = "#121822",
    bg_float = "#1a2130",
    bg_popup = "#263042",
    bg_visual = "#2b374b",
    bg_status = "#212a3a",
    bg_highlight = "#263042",

    -- Foregrounds (Arc primary: #8196b5)
    fg = "#d8dde7",
    fg_muted = "#8196b5",
    fg_dim = "#536686",
    fg_gutter = "#536686",

    -- Accents
    blue = "#69C3FF",
    green = "#3CEC85",
    yellow = "#EACD61",
    red = "#E35535",
    cyan = "#22ECDB",
    purple = "#B78AFF",
    magenta = "#F38CEC",
    orange = "#FF955C",
    pink = "#FF738A",
    lime = "#A4EF58",

    -- Semantic
    error = "#FF738A",
    warning = "#B78AFF",
    info = "#69C3FF",
    hint = "#EACD61",
    success = "#3CEC85",

    -- Base30 aliases
    black = "#1c2433",
    darker_black = "#171e2b",
    white = "#d8dde7",
    grey = "#506a8a",
    sun = "#f0db8e",
    statusline_bg = "#212a3a",
    light_grey = "#7a8da6",
    one_bg = "#263042",
    one_bg2 = "#2b374b",
    one_bg3 = "#344055",
    pmenu_bg = "#69C3FF",
    line = "#2b374b",
    nord_blue = "#5aadea",
    teal = "#22ECDB",
    baby_pink = "#FF738A",
    vibrant_green = "#3CEC85",
    dark_purple = "#9a6ee0",

    -- Terminal colors (16 ANSI)
    terminal_color_0 = "#0f1218",
    terminal_color_1 = "#E35535",
    terminal_color_2 = "#3CEC85",
    terminal_color_3 = "#EACD61",
    terminal_color_4 = "#69C3FF",
    terminal_color_5 = "#F38CEC",
    terminal_color_6 = "#22ECDB",
    terminal_color_7 = "#FFFFFF",
    terminal_color_8 = "#526587",
    terminal_color_9 = "#e97b62",
    terminal_color_10 = "#6af1a2",
    terminal_color_11 = "#f0db8e",
    terminal_color_12 = "#9cd7ff",
    terminal_color_13 = "#f8baf4",
    terminal_color_14 = "#51f0e3",
    terminal_color_15 = "#f8f9fa",
  }

  opts.on_colors(colors)

  return colors
end

return M
