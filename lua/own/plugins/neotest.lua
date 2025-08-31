return {
  {
    "nvim-neotest/neotest",
    dependencies = {
      "nvim-neotest/nvim-nio",
      "nvim-lua/plenary.nvim",
      "nvim-treesitter/nvim-treesitter",
      "nsidorenco/neotest-vstest",
    },
    config = function()
      require("neotest").setup({
        -- log_level = vim.log.levels.TRACE,
        adapters = {
          -- require("neotest-vstest"),
          require("neotest-vstest")({
            dap_settings = {
              type="coreclr"
            }
          }),
        },
      })
    end,
  },
}
