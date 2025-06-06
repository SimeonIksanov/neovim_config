return {
  {
    "stevearc/conform.nvim",
    init = function(_)
      vim.o.formatexpr = "v:lua.require('conform').formatexpr()"
    end,
    opts = {
      default_format_opts = {
        lsp_format = "fallback",
      },
      formatters_by_ft = {
        lua = { "stylua" },
        cs = {},
        json = {},
        jsonc = {},
      },
      format_on_save = {
        timeout_ms = 500,
        lsp_format = "fallback",
      },
    },
  },
}
