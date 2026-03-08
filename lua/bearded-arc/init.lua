local M = {}

function M.setup(opts)
  require("bearded-arc.config").setup(opts)
end

function M.load()
  local config = require("bearded-arc.config")

  if not config.options then
    config.setup({})
  end

  local opts = config.options

  vim.cmd("hi clear")
  vim.g.colors_name = "bearded-arc"
  vim.o.termguicolors = true
  vim.o.background = "dark"

  local palette = require("bearded-arc.palette").setup(opts)
  local groups = require("bearded-arc.groups").setup(palette, opts)

  opts.on_highlights(groups, palette)

  for group, hl in pairs(groups) do
    vim.api.nvim_set_hl(0, group, hl)
  end

  if opts.terminal_colors then
    for i = 0, 15 do
      local key = "terminal_color_" .. i
      vim.g[key] = palette[key]
    end
  end
end

function M.palette()
  local config = require("bearded-arc.config")

  if not config.options then
    config.setup({})
  end

  return require("bearded-arc.palette").setup(config.options)
end

return M
