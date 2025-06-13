-- https://docs.astral.sh/ruff/

return {
  "mfussenegger/nvim-lint",
  ft = { "python" },
  config = function()
    local lint = require("lint")
    lint.linters_by_ft = {
      python = { "ruff" },
    }
  end,
  keys = {
    { "<leader>ll", function() require("lint").try_lint() end, { desc = "Run linter" } },
  },
}
