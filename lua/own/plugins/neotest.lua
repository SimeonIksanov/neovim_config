return {
  {
    "nvim-neotest/neotest",
    dependencies = {
      "nvim-neotest/nvim-nio",
      "nvim-lua/plenary.nvim",
      "nvim-treesitter/nvim-treesitter",
      "nsidorenco/neotest-vstest",
    },
    opts = {
      log_level = vim.log.levels.DEBUG,
      adapters = {
        require("neotest-vstest"),
      },
    },
  },
}
