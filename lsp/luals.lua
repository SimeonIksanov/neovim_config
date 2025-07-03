return {
  cmd = { "lua-language-server" },
  filetypes = { "lua" },
  -- root_markers = { { ".luarc.json", ".luarc.jsonc" }, ".git" },
  root_markers = { ".luarc.json", ".luarc.jsonc", ".git" },
  settings = {
    Lua = {
      globals = { "vim" },
      runtime = {
        version = "LuaJIT",
      },
      workspace = {
        library = {
          vim.env.VIMRUNTIME,
        },
      },
    },
  },
}
