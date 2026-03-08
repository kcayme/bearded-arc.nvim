local M = {}

function M.get(c, opts)
  return {
    -- Variables (salmon = #FF738A)
    ["@variable"] = vim.tbl_extend("force", { fg = c.pink }, opts.styles.variables),
    ["@variable.builtin"] = { fg = c.orange },       -- self/this
    ["@variable.parameter"] = { fg = c.magenta },      -- parameter → magenta (VSCode semantic match)
    ["@variable.member"] = { fg = c.orange },         -- property access → orange

    -- Constants (red)
    ["@constant"] = { fg = c.red },
    ["@constant.builtin"] = { fg = c.red },           -- null, true, false
    ["@constant.macro"] = { fg = c.red },

    -- Strings (green)
    ["@string"] = vim.tbl_extend("force", { fg = c.green }, opts.styles.strings),
    ["@string.regex"] = { fg = c.lime },
    ["@string.regexp"] = { fg = c.lime },             -- Go regex patterns
    ["@string.escape"] = { fg = c.cyan },
    ["@string.special"] = { fg = c.lime },
    ["@string.special.url"] = { fg = c.blue, underline = true },

    -- Characters
    ["@character"] = { fg = c.green },
    ["@character.special"] = { fg = c.lime },

    -- Numbers (red — constants scope)
    ["@number"] = { fg = c.red },
    ["@number.float"] = { fg = c.red },
    ["@boolean"] = { fg = c.red },

    -- Functions (blue)
    ["@function"] = vim.tbl_extend("force", { fg = c.blue }, opts.styles.functions),
    ["@function.builtin"] = vim.tbl_extend("force", { fg = c.blue }, opts.styles.functions),
    ["@function.call"] = vim.tbl_extend("force", { fg = c.blue }, opts.styles.functions),
    ["@function.method"] = vim.tbl_extend("force", { fg = c.blue }, opts.styles.functions),
    ["@function.method.call"] = vim.tbl_extend("force", { fg = c.blue }, opts.styles.functions),
    ["@function.macro"] = { fg = c.blue },

    -- Constructor (function scope → blue)
    ["@constructor"] = { fg = c.blue },

    -- Keywords (yellow)
    ["@keyword"] = vim.tbl_extend("force", { fg = c.yellow }, opts.styles.keywords),
    ["@keyword.function"] = { fg = c.cyan },             -- storage: function keyword
    ["@keyword.return"] = vim.tbl_extend("force", { fg = c.yellow }, opts.styles.keywords),
    ["@keyword.operator"] = { fg = c.yellow },
    ["@keyword.import"] = { fg = c.yellow },          -- import/export scope
    ["@keyword.conditional"] = vim.tbl_extend("force", { fg = c.yellow }, opts.styles.keywords),
    ["@keyword.conditional.ternary"] = { fg = c.yellow },
    ["@keyword.repeat"] = vim.tbl_extend("force", { fg = c.yellow }, opts.styles.keywords),
    ["@keyword.exception"] = vim.tbl_extend("force", { fg = c.yellow }, opts.styles.keywords),
    ["@keyword.storage"] = { fg = c.cyan },            -- storages: class, const, let, var
    ["@keyword.directive"] = { fg = c.yellow },
    ["@keyword.type"] = { fg = c.cyan },               -- type/struct/interface/class keyword
    ["@keyword.coroutine"] = { fg = c.cyan },          -- async/await
    ["@keyword.modifier"] = { fg = c.cyan },           -- private, readonly, static, etc.
    ["@keyword.debug"] = { fg = c.orange },            -- Svelte {#debug}

    -- Operators (yellow)
    ["@operator"] = { fg = c.yellow },

    -- Types (purple — entity.name.type in Bearded Theme)
    ["@type"] = { fg = c.purple },
    ["@type.builtin"] = { fg = c.purple },
    ["@type.qualifier"] = { fg = c.purple },
    ["@type.definition"] = { fg = c.purple },

    -- Properties (orange — accessors scope)
    ["@property"] = { fg = c.orange },

    -- Attributes/Decorators (pink — decorators scope)
    ["@attribute"] = { fg = c.magenta },              -- Python @decorator
    ["@attribute.builtin"] = { fg = c.magenta },      -- @classmethod, @property, etc.

    -- Comments
    ["@comment"] = vim.tbl_extend("force", { fg = c.fg_dim }, opts.styles.comments),
    ["@comment.documentation"] = vim.tbl_extend("force", { fg = c.fg_dim }, opts.styles.comments),
    ["@comment.todo"] = { fg = c.yellow, bold = true },
    ["@comment.error"] = { fg = c.red, bold = true },
    ["@comment.warning"] = { fg = c.orange, bold = true },
    ["@comment.note"] = { fg = c.cyan, bold = true },

    -- Punctuation (muted — matches VSCode #d8dde766)
    ["@punctuation.bracket"] = { fg = c.fg_muted },
    ["@punctuation.delimiter"] = { fg = c.fg_muted },
    ["@punctuation.special"] = { fg = c.pink },

    -- Tags (HTML/JSX)
    ["@tag"] = { fg = c.blue },
    ["@tag.builtin"] = { fg = c.blue },              -- JSX built-in tags (div, span)
    ["@tag.attribute"] = { fg = c.yellow },
    ["@tag.delimiter"] = { fg = c.fg_muted },

    -- Markup
    ["@markup.heading"] = { fg = c.yellow, bold = true },
    ["@markup.heading.1"] = { fg = c.yellow, bold = true },
    ["@markup.heading.2"] = { fg = c.yellow, bold = true },
    ["@markup.heading.3"] = { fg = c.yellow, bold = true },
    ["@markup.heading.4"] = { fg = c.yellow, bold = true },
    ["@markup.heading.5"] = { fg = c.yellow, bold = true },
    ["@markup.heading.6"] = { fg = c.yellow, bold = true },
    ["@markup.bold"] = { fg = c.pink, bold = true },
    ["@markup.strong"] = { fg = c.pink, bold = true },
    ["@markup.underline"] = { underline = true },
    ["@markup.italic"] = { fg = c.orange, italic = true },
    ["@markup.strikethrough"] = { fg = c.red, strikethrough = true },
    ["@markup.link"] = { fg = c.blue, underline = true },
    ["@markup.link.url"] = { fg = c.blue, underline = true },
    ["@markup.link.label"] = { fg = c.blue },
    ["@markup.raw"] = { fg = c.purple },
    ["@markup.raw.block"] = { fg = c.purple },
    ["@markup.list"] = { fg = c.blue },
    ["@markup.quote"] = { fg = c.pink, italic = true },

    -- Modules (namespace → blue)
    ["@module"] = { fg = c.blue },
    ["@module.builtin"] = { fg = c.blue },

    -- Labels
    ["@label"] = { fg = c.pink },

    -- Misc
    ["@diff.plus"] = { fg = c.green },
    ["@diff.minus"] = { fg = c.red },
    ["@diff.delta"] = { fg = c.yellow },
  }
end

return M
