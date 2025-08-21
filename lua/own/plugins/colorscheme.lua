return {
  {
    "catppuccin/nvim",
    enabled = true,
    name = "catppuccin",
    lazy = false,
    priority = 1000,
    opts = function(opts, _)
      require("catppuccin").setup({
        flavour = "mocha",
        integrations = {
          flash = true,
          mason = true,
          neotest = true,
          snacks = true,
          treesitter = true,
          treesitter_context = true,
        },
        highlight_overrides = {
          mocha = function(mocha)
            return { Folded = { bg = "#25293C" } }
          end
        }
      })
      vim.cmd("colorscheme catppuccin")
    end,
  },
}
