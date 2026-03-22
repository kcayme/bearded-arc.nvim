local M = {}

M.plugins = {
  ["aerial.nvim"] = "aerial",
  ["avante.nvim"] = "avante",
  ["alpha-nvim"] = "alpha",
  ["atone.nvim"] = "atone",
  ["barbar.nvim"] = "barbar",
  ["beacon.nvim"] = "beacon",
  ["blink.cmp"] = "blink",
  ["bufferline.nvim"] = "bufferline",
  ["coc.nvim"] = "coc",
  ["codediff.nvim"] = "codediff",
  ["codeium.nvim"] = "codeium",
  ["colorful-winsep.nvim"] = "colorful-winsep",
  ["copilot.vim"] = "copilot",
  ["copilot.lua"] = "copilot",
  ["CopilotChat.nvim"] = "copilot-chat",
  ["code-action-menu.nvim"] = "codeactionmenu",
  ["dashboard-nvim"] = "dashboard",
  ["diffview.nvim"] = "diffview",
  ["dropbar.nvim"] = "dropbar",
  ["fff.nvim"] = "fff",
  ["fidget.nvim"] = "fidget",
  ["flash.nvim"] = "flash",
  ["fzf-lua"] = "fzf",
  ["gitsigns.nvim"] = "gitsigns",
  ["grug-far.nvim"] = "grug-far",
  ["harpoon"] = "harpoon",
  ["headlines.nvim"] = "headlines",
  ["hop.nvim"] = "hop",
  ["indent-blankline.nvim"] = "indent-blankline",
  ["lazy.nvim"] = "lazy",
  ["leap.nvim"] = "leap",
  ["lspsaga.nvim"] = "lspsaga",
  ["markview.nvim"] = "markview",
  ["mason.nvim"] = "mason",
  ["mini.nvim"] = "mini",
  ["neo-tree.nvim"] = "neo-tree",
  ["neogit"] = "neogit",
  ["neotest"] = "neotest",
  ["noice.nvim"] = "noice",
  ["nvim-bqf"] = "bqf",
  ["nvim-cmp"] = "cmp",
  ["nvim-cokeline"] = "cokeline",
  ["nvim-dap"] = "dap",
  ["nvim-dap-ui"] = "dap",
  ["nvim-navic"] = "navic",
  ["nvim-notify"] = "notify",
  ["nvim-scrollbar"] = "scrollbar",
  ["nvim-spectre"] = "spectre",
  ["nvim-tree.lua"] = "nvim-tree",
  ["nvim-treesitter-context"] = "treesitter-context",
  ["nvim-surround"] = "surround",
  ["nvim-ufo"] = "ufo",
  ["obsidian.nvim"] = "obsidian",
  ["octo.nvim"] = "octo",
  ["oil.nvim"] = "oil",
  ["outline.nvim"] = "outline",
  ["overseer.nvim"] = "overseer",
  ["rainbow-delimiters.nvim"] = "rainbow-delimiters",
  ["render-markdown.nvim"] = "render-markdown",
  ["sidekick.nvim"] = "sidekick",
  ["snacks.nvim"] = "snacks",
  ["supermaven-nvim"] = "supermaven",
  ["telekasten.nvim"] = "telekasten",
  ["telescope.nvim"] = "telescope",
  ["tiny-inline-diagnostic.nvim"] = "tiny-inline-diagnostic",
  ["todo-comments.nvim"] = "todo",
  ["trouble.nvim"] = "trouble",
  ["twilight.nvim"] = "twilight",
  ["vim-dadbod-ui"] = "dadbod-ui",
  ["vim-gitgutter"] = "gitgutter",
  ["vim-illuminate"] = "illuminate",
  ["vim-signify"] = "signify",
  ["which-key.nvim"] = "which-key",
  ["zen-mode.nvim"] = "zen-mode",
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
  local transparent = opts.transparent
  palette.sidebar_bg = (transparent or opts.styles.sidebars == "transparent") and palette.none
    or opts.styles.sidebars == "normal" and palette.bg
    or palette.bg_dark
  palette.float_bg = (transparent or opts.styles.floats == "transparent") and palette.none
    or opts.styles.floats == "normal" and palette.bg
    or palette.bg_float

  local groups = {}

  -- Always load core groups
  for _, name in ipairs({ "base", "treesitter", "semantic_tokens", "git" }) do
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
