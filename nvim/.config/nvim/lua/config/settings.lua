local opt = vim.opt
local g = vim.g

g.mapleader = ' '
gpt.mapleader = ' '

vim.diagnostic.config({
  virtual_text = true,
  underline = true
})

-- Line numbers
opt.nu = true
opt.relativenumber = true

-- Indentation
opt.tabstop = 2
opt.softtabstop = 2
opt.shiftwidth = 2
opt.expandtab = true
opt.expandtab = true
opt.smarttab = true
opt.smartindent = true
opt.autoindent = true
opt.breakindent = true

-- Text wrap - Term colors
opt.wrap = false
opt.termguicolors = true

-- File
opt.swapfile = false
opt.backup = false
opt.undodir = os.getenv("HOME") .. "/.cache/nvim/undodir"
opt.undofile = true

-- Search
opt.hlsearch = false
opt.incsearch = true
opt.ignorecase = true
opt.smartcase = true
opt.inccommand = "split"

-- Scroll
opt.scrolloff = 9
opt.signcolumn = "yes"

-- Splits
opt.splitright = true
opt.splitbelow = true