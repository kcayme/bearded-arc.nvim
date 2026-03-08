local M = {}

M.plugins = {
  ["blink.cmp"] = "blink",
  ["nvim-cokeline"] = "cokeline",
  ["flash.nvim"] = "flash",
  ["fzf-lua"] = "fzf",
  ["gitsigns.nvim"] = "gitsigns",
  ["indent-blankline.nvim"] = "indent-blankline",
  ["lazy.nvim"] = "lazy",
  ["nvim-tree.lua"] = "nvim-tree",
  ["snacks.nvim"] = "snacks",
  ["telescope.nvim"] = "telescope",
  ["trouble.nvim"] = "trouble",
  ["which-key.nvim"] = "which-key",
}

function M.get_enabled(opts)
  local enabled = {}
  for plugin_name, group_name in pairs(M.plugins) do
    local plugin_opt = opts.plugins[group_name]
    if plugin_opt == true then
      enabled[group_name] = true
    elseif plugin_opt ~= false then
      -- auto-detect
      if opts.plugins.all then
        enabled[group_name] = true
      elseif opts.plugins.auto then
        local lazy_config_ok, lazy_config = pcall(require, "lazy.core.config")
        if lazy_config_ok and lazy_config.plugins[plugin_name] then
          enabled[group_name] = true
        end
      end
    end
  end
  return enabled
end

function M.setup(palette, opts)
  local groups = {}

  -- Always load core groups
  for _, name in ipairs({ "base", "treesitter", "semantic_tokens" }) do
    local mod = require("bearded-arc.groups." .. name)
    local hls = mod.get(palette, opts)
    for k, v in pairs(hls) do
      groups[k] = v
    end
  end

  -- Load enabled plugin groups
  local enabled = M.get_enabled(opts)
  for name in pairs(enabled) do
    local ok, mod = pcall(require, "bearded-arc.groups." .. name)
    if ok then
      local hls = mod.get(palette, opts)
      for k, v in pairs(hls) do
        groups[k] = v
      end
    end
  end

  return groups
end

return M
