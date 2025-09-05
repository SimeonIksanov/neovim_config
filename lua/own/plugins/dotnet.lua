-- got it here https://github.com/sebastianstudniczek/.dotfiles/blob/main/nvim/.config/nvim/lua/plugins/roslyn.lua
vim.api.nvim_create_autocmd({ "InsertLeave" }, {
  pattern = "*",
  callback = function()
    local clients = vim.lsp.get_clients({ name = "roslyn" })
    if not clients or #clients == 0 then
      return
    end

    local client = assert(clients[1])
    local buffers = vim.lsp.get_buffers_by_client_id(client.id)
    for _, buf in ipairs(buffers) do
      local params = {
        textDocument = vim.lsp.util.make_text_document_params(buf),
      }
      client:request(vim.lsp.protocol.Methods.textDocument_diagnostic, params, nil, buf)
    end
  end,
})

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
