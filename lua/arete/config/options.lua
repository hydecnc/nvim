local opt = vim.o

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

opt.ignorecase = true -- Ignore case in search patterns
opt.smartcase = true -- Don't ignore case with capital letters
opt.signcolumn = 'yes' -- Always show signcolumn
opt.updatetime = 200 -- Decrease update time
opt.timeoutlen = 300 -- Decrease mapped sequence wait time
opt.splitright = true -- Put new windows below current
opt.splitkeep = 'screen'
opt.splitbelow = true -- Put new window right of current
opt.list = true -- Show invisible characters
opt.listchars = 'tab:» ,trail:·,nbsp:␣' -- Set characters for displaying in list mode
opt.inccommand = 'nosplit' -- Preview incremental substitute
opt.cursorline = true -- Show which line your cursor is on
opt.scrolloff = 8 -- Minimal number of screen lines to keep above and below the cursor.
opt.tabstop = 2 -- Set tab size
opt.shiftwidth = 2 -- Set (auto)indent size
opt.shiftround = true -- Round indent to multiple of shiftwidth
opt.expandtab = true -- Use spaces instead of tabs
opt.smartindent = true -- Insert indents automatically
opt.cmdheight = 0 -- Toggle command line

-- Wrap lines at convenient places
opt.linebreak = true
opt.wrap = false

-- if performing an operation that would fail due to unsaved changes in the buffer (like `:q`),
-- instead raise a dialog asking if you wish to save the current file(s)
-- See `:help 'confirm'`
opt.confirm = true

-- Enable spell check
opt.spell = true

vim.g.snacks_animate = false

-- vim: ts=2 sts=2 sw=2 et
