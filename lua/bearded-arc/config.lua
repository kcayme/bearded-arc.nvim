local M = {}

M.defaults = {
  transparent = false,
  terminal_colors = true,
  dim_inactive = false,
  styles = {
    comments = { italic = true },
    keywords = {},
    functions = {},
    variables = {},
    strings = {},
  },
  on_colors = function(colors) end,
  on_highlights = function(highlights, colors) end,
  plugins = {
    all = package.loaded.lazy == nil,
    auto = true,
  },
}

M.options = nil

function M.setup(opts)
  M.options = vim.tbl_deep_extend("force", {}, M.defaults, opts or {})
end

function M.extend(opts)
  M.options = vim.tbl_deep_extend("force", {}, M.options or M.defaults, opts or {})
end

return M
