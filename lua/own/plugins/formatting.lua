return {
  {
    "stevearc/conform.nvim",
    enabled = true,
    -- init = function(_)
    --   vim.o.formatexpr = "v:lua.require('conform').formatexpr()"
    -- end,
    opts = {
      default_format_opts = {
        lsp_format = "fallback",
      },
      formatters_by_ft = {
        lua = { "stylua" },
        cs = {},
        json = {},
        jsonc = {},
        python = { "ruff_fix", "ruff_format", "ruff_organize_imports" },
      },
      format_on_save = {
        timeout_ms = 500,
        lsp_format = "fallback",
      },
    },
    keys = {
      {
        "<leader>lf",
        function()
          require("conform").format()
        end,
        mode = { "n", "v" },
        desc = "Format document",
      },
    },
  },
}
