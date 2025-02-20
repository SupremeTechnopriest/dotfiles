-- Leader
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- Cursor --
vim.opt.cursorline = true
vim.opt.cursorcolumn = true
vim.opt.number = true
vim.opt.termguicolors = true

-- Numbers --
vim.opt.nu = true
vim.opt.relativenumber = true

-- Tabs --
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true

-- Indent --
vim.opt.smartindent = true

-- Search --
vim.opt.hlsearch = false
vim.opt.incsearch = true

-- Fold --
vim.opt.fillchars = [[eob: ,fold: ,foldopen:,foldsep: ,foldclose:]]
vim.opt.foldcolumn = "1"
vim.opt.foldlevel = 99
vim.opt.foldlevelstart = 99
vim.opt.foldenable = true

vim.diagnostic.config({ virtual_text = false })
