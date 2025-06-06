vim.cmd("set makeprg=dotnet")
vim.opt.autowrite = true
vim.cmd("compiler dotnet")
vim.opt.commentstring = "// %s"
