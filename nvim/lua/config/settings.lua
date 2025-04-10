local opt = vim.opt

opt.guicursor = ""

-- Line numbers
opt.nu = true
opt.relativenumber=true

-- Indentation
opt.tabstop = 2
opt.softtabstop = 2
opt.shiftwidth = 2
opt.expandtab = true
opt.expandtab = true

-- Text wrap
opt.wrap = false

-- File
opt.swapfile = false
opt.backup = false
opt.undodir = os.getenv("HOME") .. "/.nvim/undodir"
opt.undofile = true

-- Search
opt.hlsearch = false
opt.incsearch = true

-- Colors
opt.termguicolors = true

-- Scroll
opt.scrolloff = 9
opt.signcolumn = "yes"

-- To make the editor feel more responsive, supposedly
opt.updatetime = 250

-- If i want to have a border at 80 characters
-- opt.colorcolumn = "80"
