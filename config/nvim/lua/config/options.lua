local opt = vim.opt

opt.number = true
opt.relativenumber = true

opt.tabstop = 4
opt.shiftwidth = 4
opt.expandtab = true
opt.autoindent = true
opt.smartindent = true

opt.wrap = false

opt.ignorecase = true
opt.smartcase = true
opt.hlsearch = true
opt.incsearch = true

opt.cursorline = true

opt.termguicolors = true
opt.background = "dark"
opt.signcolumn = "yes"

opt.backspace = "indent,eol,start"

opt.clipboard:append("unnamedplus")

opt.splitright = true
opt.splitbelow = true

opt.iskeyword:append("-")

opt.undofile = true

opt.updatetime = 50

opt.scrolloff = 8

opt.modelines = 0
opt.secure = true

opt.swapfile = false
opt.backup = false
opt.writebackup = false
