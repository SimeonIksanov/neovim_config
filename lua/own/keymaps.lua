local opts = { noremap = true, silent = true }
vim.keymap.set("n", "<space>", "<nop>", opts)
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<cr>", opts)

vim.keymap.set("i", "jj", "<Esc>", opts)
vim.keymap.set("i", "jk", "<Esc>", opts)

vim.keymap.set("n", "<C-j>", "<C-w>j", opts)
vim.keymap.set("n", "<C-k>", "<C-w>k", opts)
vim.keymap.set("n", "<C-h>", "<C-w>h", opts)
vim.keymap.set("n", "<C-l>", "<C-w>l", opts)

vim.keymap.set("v", "<S-j>", ":m '>+1<CR>gv=gv", opts)
vim.keymap.set("v", "<S-k>", ":m '<-2<CR>gv=gv", opts)
vim.keymap.set("n", "vig", "ggVG", opts)
vim.keymap.set("n", "<C-d>", "<C-d>zz", opts)
vim.keymap.set("n", "<C-u>", "<C-u>zz", opts)
vim.keymap.set("n", "n", "nzz", opts)
vim.keymap.set("n", "N", "Nzz", opts)
vim.keymap.set("n", "*", "*zz", opts)
vim.keymap.set("n", "#", "#zz", opts)
