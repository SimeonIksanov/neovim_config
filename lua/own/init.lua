require("own.functions")

require("own.neovide")
require("own.options")

if vim.loop.os_uname().sysname == "Windows" then
  require("own.powershell")
end

require("own.lazy_init")

require("own.diagnostic")
require("own.keymaps")
require("own.lsp")
