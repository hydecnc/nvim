local opt = vim.o

-- Numbers
opt.number = true
opt.relativenumber = true

-- Enable mouse mode, can be useful for resizing splits for example!
opt.mouse = 'a'

-- Don't show the mode, since it's already in the status line
opt.showmode = false

-- Sync clipboard between OS and Neovim.
vim.schedule(function()
  opt.clipboard = 'unnamedplus'
end)

-- Enable break indent
opt.breakindent = true

-- Save undo history
opt.undofile = true
opt.undolevels = 10000

-- Search settings
opt.ignorecase = true -- Ignore case in search patterns
opt.smartcase = true -- Don't ignore case with capital letters
opt.signcolumn = 'yes' -- Always show signcolumn
opt.incsearch = true -- Show matches as you type

-- Split settings
opt.splitbelow = true -- Put new window right of current
opt.splitright = true -- Put new windows below current
opt.splitkeep = 'screen'

-- Visual settings
opt.list = true -- Show invisible characters
opt.listchars = 'tab:» ,trail:·,nbsp:␣' -- Set characters for displaying in list mode
opt.inccommand = 'nosplit' -- Preview incremental substitute
opt.cursorline = true -- Show which line your cursor is on
opt.scrolloff = 10 -- Minimal number of screen lines to keep above and below the cursor.
opt.sidescrolloff = 8
opt.cmdheight = 0 -- Toggle command line
opt.updatetime = 200 -- Decrease update time
opt.timeoutlen = 300 -- Decrease mapped sequence wait time
opt.termguicolors = true

-- Indentation
opt.tabstop = 2
opt.shiftwidth = 2
opt.softtabstop = 2
opt.expandtab = true -- Use spaces instead of tabs
opt.smartindent = true -- Insert indents automatically
opt.shiftround = true -- Round indent to multiple of shiftwidth

-- Wrap lines at convenient places
opt.linebreak = true
opt.wrap = false

-- if performing an operation that would fail due to unsaved changes in the buffer (like `:q`),
-- instead raise a dialog asking if you wish to save the current file(s)
-- See `:help 'confirm'`
opt.confirm = true

-- Enable spell check
opt.spell = true

-- Performance Improvements
opt.redrawtime = 10000
opt.maxmempattern = 20000

vim.g.snacks_animate = false

-- vim: ts=2 sts=2 sw=2 et
