---@diagnostic disable: undefined-global
return {
  {
    "folke/snacks.nvim",
    priority = 1000,
    lazy = false,
    opts = {
      dashboard = { enabled = false },
      input = { enabled = false },
      bigfile = { enabled = false },
      quickfile = { enabled = false },
      scope = { enabled = false },
      statuscolumn = { enabled = true },
      notifier = { enabled = false, timeout = 3000 },
      profiler = { enabled = false },
      rename = { enabled = false },
      scroll = { enabled = false },
      words = { enabled = false },
      zen = { enabled = false },
      indent = {
        enabled = true,
        animate = { enabled = false },
        scope = { only_current = true },
      },
    },
    keys = {
      { "<leader><space>", function() Snacks.picker.pick() end, desc = "Smart find files", },
      { "<leader>e", function() Snacks.explorer() end, desc = "File Explorer", },
      { "<leader>,", function() Snacks.picker.buffers({ current = false, sort_lastused = true, layout = "select" }) end, desc = "Buffers", },
      { "<leader>/", function() Snacks.picker.grep() end, desc = "Grep", },
      -- find
      -- { "<leader>fb", function() Snacks.picker.buffers() end, desc = "Buffers", },
      { "<leader>fc", function() Snacks.picker.files({ cwd = vim.fn.stdpath("config") }) end, desc = "Find config files", },
      { "<leader>ff", function() Snacks.picker.files() end, desc = "Find files", },
      { "<leader>fs", function() Snacks.picker.smart() end, desc = "Smart find files", },
      { "<leader>fk", function() Snacks.picker.keymaps({layout = "select"}) end, desc = "Keymaps", },
      { "<leader>fg", function() Snacks.picker.git_files() end, desc = "Find Git Files", },
      { "<leader>fp", function() Snacks.picker.projects({ projects = { vim.fn.stdpath("config") }, patterns = {}, recent = false }) end, desc = "Projects", },
      { "<leader>fr", function() Snacks.picker.recent() end, desc = "Recent", },
      -- lsp
      { "<leader>ld", function() Snacks.picker.diagnostics_buffer() end, desc = "Diagnostics: File", },
      { "<leader>lD", function() Snacks.picker.diagnostics() end, desc = "Diagnostics: File", },
      { "gd", function() Snacks.picker.lsp_definitions() end, desc = "Goto Definition", },
      { "gD", function() Snacks.picker.lsp_declarations() end, desc = "Goto Declaration", },
      { "gr", function() Snacks.picker.lsp_references() end, nowait = true, desc = "References", },
      { "gI", function() Snacks.picker.lsp_implementations() end, desc = "Goto Implementation", },
      { "gy", function() Snacks.picker.lsp_type_definitions() end, desc = "Goto T[y]pe Definition", },
      { "<leader>ss", function() Snacks.picker.lsp_symbols() end, desc = "LSP Symbols", },
      { "<leader>sS", function() Snacks.picker.lsp_workspace_symbols() end, desc = "LSP Workspace Symbols", },
      -- terminal
      { "<c-\\>", function() Snacks.terminal.toggle() end, mode = {"n", "t"}, desc = "Toggle Terminal"},
    },
  },
}
