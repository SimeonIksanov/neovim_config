vim.api.nvim_create_autocmd("InsertEnter", { command = [[ set norelativenumber ]] })
vim.api.nvim_create_autocmd("InsertLeave", { command = [[ set relativenumber ]] })

vim.api.nvim_create_autocmd("TermOpen", { command = [[ set nonumber norelativenumber ]] })
vim.api.nvim_create_autocmd("TextYankPost", { callback = function() vim.highlight.on_yank() end, })
