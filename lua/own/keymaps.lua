vim.g.mapleader = " "
vim.g.maplocalleader = " "

vim.keymap.set("n", "<Esc><Esc>", "<cmd>nohlsearch<cr>", {})

vim.keymap.set("i", "jj", "<Esc>", {})
vim.keymap.set("i", "jk", "<Esc>", {})

vim.keymap.set("n", "<C-j>", "<C-w>j", {})
vim.keymap.set("n", "<C-k>", "<C-w>k", {})
vim.keymap.set("n", "<C-h>", "<C-w>h", {})
vim.keymap.set("n", "<C-l>", "<C-w>l", {})

-- vim.keymap.set("n", "<S-j>", "mzJ`z")
vim.keymap.set("v", "<S-j>", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "<S-k>", ":m '<-2<CR>gv=gv")
