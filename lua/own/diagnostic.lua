vim.diagnostic.config({
  signs = {
    text = {
      [vim.diagnostic.severity.ERROR] = "󰅚 ",
      [vim.diagnostic.severity.WARN] = "󰀪 ",
      [vim.diagnostic.severity.INFO] = "󰋽 ",
      [vim.diagnostic.severity.HINT] = "󰌶 ",
    },
    numhl = {
      [vim.diagnostic.severity.ERROR] = "DiagnosticSignError",
      [vim.diagnostic.severity.WARN] = "DiagnosticSignWarn",
      [vim.diagnostic.severity.INFO] = "DiagnosticSignInfo",
      [vim.diagnostic.severity.HINT] = "DiagnosticSignHint",
      [vim.diagnostic.severity.N] = "DiagnosticSignInfo",
    },
  },
  virtual_text = false,
  -- virtual_text = {
  --   current_line = true,
  --   spacing = 4,
  --   prefix = "●",
  -- },
  virtual_lines = {
    current_line = true,
  },
  underline = true,
  update_in_insert = false,
  severity_sort = true,
})
