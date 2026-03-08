local M = {}

function M.get(c, opts)
  return {
    GrugFarResultsMatch = { link = "DiffChange" },
    GrugFarResultsMatchAdded = { link = "DiffAdd" },
    GrugFarResultsMatchRemoved = { link = "DiffDelete" },
  }
end

return M
