return {
  {
    "seblyng/roslyn.nvim",
    enabled = true,
    ft = {
      "cs",
      -- "razor"
    },
    opts = {
      filewatching = "auto",
      choose_target = nil,
      ignore_target = nil,
      broad_search = true,
      lock_target = false,
      debug = false,
    },
  },
}
