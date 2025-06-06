return {
  {
    "saghen/blink.cmp",
    -- optional: provides snippets for the snippet source
    dependencies = { "rafamadriz/friendly-snippets" },
    version = "1.*",
    enabled = true,
    opts = {
      cmdline = { enabled = false },
      completion = {
        keyword = { range = "full" },
        accept = { auto_brackets = { enabled = true } },
        list = { selection = { preselect = false, auto_insert = false } },
        menu = {
          auto_show = true,
          draw = {
            columns = {
              { "kind_icon" },
              { "label", "label_description", gap = 1 },
              { "kind" },
              { "source_id" },
            },
          },
          border = "single",
        },
        documentation = {
          auto_show = true,
          auto_show_delay_ms = 500,
          window = { border = "single" },
        },
        ghost_text = { enabled = false },
      },
      keymap = {
        ["<C-j>"] = { "select_next", "fallback_to_mappings" },
        ["<C-k>"] = { "select_prev", "fallback_to_mappings" },
        ["<C-e>"] = { "hide" },
        ["<Tab>"] = { "accept", "fallback" },
        ["<Enter>"] = { "accept", "fallback" },
        ["<C-Space>"] = { "show", "show_documentation", "hide_documentation" },
        ["<C-b>"] = { "scroll_documentation_up", "fallback" },
        ["<C-f>"] = { "scroll_documentation_down", "fallback" },
        ["<C-s>"] = { "show_signature", "hide_signature", "fallback" },
      },
      sources = {
        default = { "lsp", "path", "snippets", "buffer" },
      },
      snippets = { preset = "default" },
      signature = {
        enabled = true,
        window = {
          border = "single",
          direction_priority = { "s", "n" },
          show_documentation = true,
        },
      },
      fuzzy = {
        implementation = "lua",
        sorts = { "exact", "score", "sort_text" },
      },
    },
  },
}
