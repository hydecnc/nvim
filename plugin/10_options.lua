-- General settings
vim.g.mapleader = ' '

vim.o.switchbuf = 'usetab'
vim.o.undofile = true

vim.o.shada = "'100,<50,s10,:1000,/100,@100,h" -- Limit ShaDa file (for startup)

-- UI
vim.o.cmdheight = 0
vim.o.cursorlineopt = 'screenline,number' -- Show cursor line per screen line
vim.o.number = true
vim.o.pumborder = 'single' -- Use border in popup menu
vim.o.pumheight = 10 -- Make popup menu smaller
vim.o.pummaxwidth = 100 -- Make popup menu not too wide
vim.o.relativenumber = true
vim.o.ruler = false
vim.o.showmode = false
vim.o.signcolumn = 'auto'
vim.o.termguicolors = true

vim.o.fillchars = 'eob: ,fold:╌'
vim.o.listchars = 'extends:…,nbsp:␣,precedes:…,tab:> '

-- Editing
vim.o.autoindent = true
vim.o.expandtab = true
vim.o.formatoptions = 'rqnl1j' -- Improve comment editing
vim.o.ignorecase = true
vim.o.infercase = true
vim.o.shiftwidth = 2
vim.o.smartcase = true
vim.o.smartindent = true
vim.o.softtabstop = 2
vim.o.spelloptions = 'camel'
vim.o.tabstop = 2
vim.o.virtualedit = 'block'

vim.o.redrawtime = 10000
vim.o.timeoutlen = 300
vim.o.updatetime = 200

--- Completion
vim.o.complete = '.,w,b,kspell'
vim.o.completeopt = 'menuone,noselect,fuzzy,nosort'
vim.o.completetimeout = 100
