return {
  {
    "seblyng/roslyn.nvim",
    enabled = true,
    ft = {
      "cs",
      -- "razor"
    },
    opts = {
      filewatching = "roslyn",
      choose_target = nil,
      ignore_target = nil,
      broad_search = false,
      lock_target = false,
    },
  },
}
