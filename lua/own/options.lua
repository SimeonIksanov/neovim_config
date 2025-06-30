-- https://github.com/ruicsh/nvim-config -- great
vim.g.mapleader = " "
vim.g.maplocalleader = " "
vim.opt.backup = false
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.numberwidth = 4
vim.opt.mouse = ""
vim.opt.ignorecase = true
vim.opt.smartcase = true

vim.opt.tabstop = 8
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.opt.breakindent = true
vim.opt.smartindent = true
-- vim.opt.autoindent = true

-- vim.opt.pumheight = 5
vim.opt.wrap = false

vim.opt.swapfile = false
vim.opt.backup = false

vim.opt.hlsearch = true
vim.opt.incsearch = true

vim.opt.termguicolors = true
vim.opt.scrolloff = 4
vim.opt.sidescrolloff = 8
vim.opt.signcolumn = "yes"
vim.opt.laststatus = 3
vim.opt.lazyredraw = true
vim.opt.isfname:append("@-@")

vim.opt.updatetime = 50
vim.opt.colorcolumn = "100"
vim.opt.cursorline = true

vim.opt.showmode = false
vim.opt.swapfile = false

vim.opt.winborder = "rounded"
vim.opt.fileencoding = "utf-8"
vim.opt.encoding = "utf-8"
vim.cmd("language en_US.UTF-8")
vim.cmd("highlight Folded None")
vim.opt.formatoptions:remove({ "r", "o" })
vim.opt.foldcolumn = "0"
vim.opt.foldenable = true
vim.opt.foldlevel = 99
vim.opt.foldlevelstart = 99
vim.opt.foldnestmax = 4
vim.opt.foldtext = "v:lua.custom_foldtext()"
vim.opt.foldmethod = "expr"
vim.opt.splitright = true
vim.opt.splitbelow = true
vim.opt.timeoutlen = 600
vim.opt.list = true
vim.opt.listchars = {
  trail = "·",
  tab = "» ",
  nbsp = "␣",
}
vim.opt.fillchars = {
  fold = " ",
  foldopen = "",
  foldsep = " ",
  foldclose = "",
}
vim.opt.completeopt = { "noinsert", "menuone", "noselect" }
vim.opt.joinspaces = true
vim.opt.wildignore:append({ ".DS_store", "**/node_modules/**" })
vim.opt.signcolumn = "yes"
