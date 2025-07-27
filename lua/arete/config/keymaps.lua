local map = vim.keymap.set

-- Remove highlight on Esc
map('n', '<Esc>', '<cmd>nohlsearch<CR>')

-- Move by visual lines
map('n', 'j', 'gj', { noremap = true, silent = true })
map('n', 'k', 'gk', { noremap = true, silent = true })
map('v', 'j', 'gj', { noremap = true, silent = true })
map('v', 'k', 'gk', { noremap = true, silent = true })

-- Diagnostic keymaps
map('n', '<leader>dq', vim.diagnostic.setloclist, { desc = 'Open [D]iagnostic [Q]uickfix list' })

-- Terminal mappings
map('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })
map('t', '<C-e><C-t>', '<C-\\><C-n>', { desc = '[E]xit [T]erminal mode' })
map('t', '<C-/>', '<cmd>close<cr>', { desc = 'Hide Terminal' })

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
map('n', '<leader>qq', '<cmd>qa<CR>', { desc = 'Quit all' })

-- Better indenting in visual mode
map('v', '<', '<gv', { desc = 'Indent left and reselect' })
map('v', '>', '>gv', { desc = 'Indent right and reselect' })

-- Split keymaps
map('n', '<leader>-', '<cmd>split<CR>', { desc = 'Split window below' })
map('n', '<leader>|', '<cmd>vsplit<CR>', { desc = 'Split window right' })

-- Buffer keymaps
map('n', '<leader>bn', '<cmd>bnext<CR>', { desc = 'Swap to next buffer' })
map('n', '<leader>bp', '<cmd>bprevious<CR>', { desc = 'Swap to previous buffer' })
map('n', '<leader>bd', function()
  Snacks.bufdelete()
end, { desc = 'Delete Buffer' })
map('n', '<leader>bo', function()
  Snacks.bufdelete.other()
end, { desc = 'Delete Other Buffers' })

-- Toggle format on save
map('n', '<leader>tf', '<cmd>ToggleFormat<CR>', { noremap = true, desc = '[T]oggle [F]ormat' })
