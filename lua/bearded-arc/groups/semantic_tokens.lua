local M = {}

function M.get(c, opts)
  return {
    -- Types (matched to Bearded Theme semanticTokenColors)
    ["@lsp.type.namespace"] = { fg = c.blue },
    ["@lsp.type.type"] = { fg = c.purple },
    ["@lsp.type.class"] = { fg = c.purple },
    ["@lsp.type.enum"] = { fg = c.purple },
    ["@lsp.type.interface"] = { fg = c.purple },
    ["@lsp.type.struct"] = { fg = c.purple },
    ["@lsp.type.parameter"] = { fg = c.magenta },     -- parameter → magenta (#F38CEC)
    ["@lsp.type.variable"] = { fg = c.pink },          -- variable → salmon (#FF738A)
    ["@lsp.type.property"] = { fg = c.orange },        -- property → orange
    ["@lsp.type.enumMember"] = { fg = c.purple },
    ["@lsp.type.function"] = { fg = c.blue },
    ["@lsp.type.method"] = { fg = c.blue },
    ["@lsp.type.macro"] = { fg = c.blue },
    ["@lsp.type.keyword"] = { fg = c.yellow },
    ["@lsp.type.comment"] = { fg = c.fg_dim },
    ["@lsp.type.string"] = { fg = c.green },
    ["@lsp.type.number"] = { fg = c.red },
    ["@lsp.type.operator"] = { fg = c.yellow },
    ["@lsp.type.decorator"] = { fg = c.magenta },

    -- Modifiers
    ["@lsp.mod.deprecated"] = { strikethrough = true },

    -- Type + Modifier combinations
    ["@lsp.typemod.function.defaultLibrary"] = { fg = c.blue },
    ["@lsp.typemod.variable.defaultLibrary"] = { fg = c.cyan },
    ["@lsp.typemod.class.declaration"] = { fg = c.purple },
    ["@lsp.typemod.class.decorator"] = { fg = c.magenta },
    ["@lsp.typemod.property.declaration"] = { fg = c.fg },
  }
end

return M
