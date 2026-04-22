-- General settings
vim.g.mapleader = ' '

vim.o.switchbuf = 'usetab'
vim.o.undofile = true

vim.o.shada = "'100,<50,s10,:1000,/100,@100,h" -- Limit ShaDa file (for startup)

-- UI
vim.o.breakindent = true
vim.o.cmdheight = 0
vim.o.cursorline = true
vim.o.cursorlineopt = 'screenline,number'
vim.o.fillchars = 'eob: ,fold:╌'
vim.o.linebreak = true
vim.o.list = true
vim.o.listchars = 'extends:…,nbsp:␣,precedes:…,tab:> '
vim.o.number = true
vim.o.pumborder = 'single' -- Use border in popup menu
vim.o.pumheight = 10 -- Make popup menu smaller
vim.o.pummaxwidth = 100 -- Make popup menu not too wide
vim.o.relativenumber = true
vim.o.ruler = false
vim.o.showmode = false
vim.o.signcolumn = 'yes'
vim.o.splitbelow = true
vim.o.splitright = true
vim.o.termguicolors = true
vim.o.winborder = 'single'
vim.o.wrap = false

-- Editing
vim.o.autoindent = true
vim.o.expandtab = true
vim.o.formatoptions = 'rqnl1j' -- Improve comment editing
vim.o.ignorecase = true
vim.o.incsearch = true
vim.o.infercase = true
vim.o.shiftwidth = 2
vim.o.smartcase = true
vim.o.smartindent = true
vim.o.softtabstop = 2
vim.o.spelloptions = 'camel'
vim.o.tabstop = 2
vim.o.virtualedit = 'block'
