vim.lsp.enable({
  "luals",
  "roslyn",
  "vscode-json-language-server",
  "basedpyright",
  -- "ruff"
})

vim.api.nvim_create_autocmd("LspAttach", {
  callback = function(args)
    local client = vim.lsp.get_client_by_id(args.data.client_id)
    local win = vim.api.nvim_get_current_win()
    if client ~= nil and client:supports_method("textDocument/foldingRange") then
      vim.wo[win][0].foldexpr = "v:lua.vim.lsp.foldexpr()"
      vim.wo[win][0].foldtext = ""
    else
      vim.wo[win][0].foldexpr = "nvim_treesitter#foldexpr()"
      vim.wo[win][0].foldtext = ""
    end

    vim.keymap.set("n", "<leader>la", vim.lsp.buf.code_action, {})
    vim.keymap.set("n", "<leader>lr", vim.lsp.buf.rename, {})
  end,
})
