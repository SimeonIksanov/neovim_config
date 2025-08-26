local toggleOil = function()
  if vim.bo.filetype == "oil" then
    require("oil").close()
  else
    require("oil").open()
  end
end

local toggleFloatOil = function()
  require("oil").toggle_float()
end

return {
  {
    "stevearc/oil.nvim",
    opts = function(_, opts)
      vim.keymap.set("n", "<leader>e", toggleOil, { desc = "Toggle file [E]xplorer" })
      vim.keymap.set("n", "<leader>E", toggleFloatOil, { desc = "Toggle file [E]xplorer(float)" })

      return {
        default_file_explorer = true,
        float = {
          max_width = 0.8,
          max_height = 0.8,
        },
        keymaps = {
          ["gd"] = {
            desc = "Toggle file detail view",
            callback = function()
              detail = not detail
              if detail then
                require("oil").set_columns({ "icon", "permissions", "size", "mtime" })
              else
                require("oil").set_columns({ "icon" })
              end
            end,
          },
        },
      }
    end,
    dependencies = { "nvim-tree/nvim-web-devicons" }, -- use if you prefer nvim-web-devicons
    lazy = false,
  },
}
