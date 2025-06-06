vim.lsp.enable({
  "luals",
  "roslyn",
  "vscode-json-language-server",
})

vim.api.nvim_create_autocmd("LspAttach", {
  callback = function(args)
    local client = vim.lsp.get_client_by_id(args.data.client_id)
    if client ~= nil and client:supports_method("textDocument/foldingRange") then
      local win = vim.api.nvim_get_current_win()
      vim.wo[win][0].foldexpr = "v:lua.vim.lsp.foldexpr()"
      vim.wo[win][0].foldtext = ""
    end

    vim.keymap.set("n", "<leader>la", "<cmd>lua vim.lsp.buf.code_action()<cr>")
    vim.keymap.set("n", "<leader>lr", "<cmd>lua vim.lsp.buf.rename()<cr>")
  end,
})
