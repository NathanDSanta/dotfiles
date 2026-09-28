local o = vim.opt
local g = vim.g
o.termguicolors = true
g.mapleader = ' '
g.mapleader = ' '
o.number = true
o.relativenumber = true
o.undofile = true
o.ignorecase = true
o.smartcase = true
o.splitright = true
o.splitbelow = true
o.expandtab = true
o.shiftwidth = 2
o.tabstop = 2
o.softtabstop = 2
o.wrap = false
o.smartindent = true
o.autoindent = true
o.breakindent = true
o.signcolumn = "yes"
o.scrolloff = 8
o.incsearch = true
vim.diagnostic.config({
  virtual_text = true,
  underline = true
})
