local map = vim.keymap.set

-- Remove highlight on Esc
map('n', '<Esc>', '<Cmd>nohlsearch<CR>')

-- Move by visual lines
map('n', 'j', 'gj', { noremap = true, silent = true })
map('n', 'k', 'gk', { noremap = true, silent = true })
map('v', 'j', 'gj', { noremap = true, silent = true })
map('v', 'k', 'gk', { noremap = true, silent = true })

-- Diagnostic keymaps
map('n', '<leader>dq', vim.diagnostic.setloclist, { desc = 'Open [D]iagnostic [Q]uickfix list' })

-- Terminal mappings
map('n', '<leader>st', function()
  vim.cmd.vnew()
  vim.cmd.term()
  vim.cmd.wincmd 'J'
  vim.api.nvim_win_set_height(0, 15)
end, { desc = '[S]mall [T]erminal' })
map('t', '<C-e><C-t>', '<C-\\><C-n>', { desc = '[E]xit [T]erminal mode' })

--  Use CTRL+<hjkl> to switch between windows
map('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
map('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
map('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
map('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })

-- Center screen when jumping
map('n', 'n', 'nzzzv', { desc = 'Next search result (centered)' })
map('n', 'N', 'Nzzzv', { desc = 'Previous search result (centered)' })
map('n', '<C-d>', '<C-d>zz', { desc = 'Half page down (centered)' })
map('n', '<C-u>', '<C-u>zz', { desc = 'Half page up (centered)' })

-- Quit all
map('n', '<leader>qq', '<Cmd>qa<CR>', { desc = 'Quit all' })

-- Better indenting in visual mode
map('v', '<', '<gv', { desc = 'Indent left and reselect' })
map('v', '>', '>gv', { desc = 'Indent right and reselect' })

-- Split keymaps
map('n', '<leader>-', '<Cmd>split<CR>', { desc = 'Split window below' })
map('n', '<leader>|', '<Cmd>vsplit<CR>', { desc = 'Split window right' })

-- Buffer keymaps
map('n', '<leader>bn', '<Cmd>bnext<CR>', { desc = 'Swap to next buffer' })
map('n', '<leader>bp', '<Cmd>bprevious<CR>', { desc = 'Swap to previous buffer' })
