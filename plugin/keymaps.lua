local map = vim.keymap.set

map('n', '<Esc>', '<Cmd>nohlsearch<CR>')

map('n', 'j', 'gj', { noremap = true, silent = true })
map('n', 'k', 'gk', { noremap = true, silent = true })
map('v', 'j', 'gj', { noremap = true, silent = true })
map('v', 'k', 'gk', { noremap = true, silent = true })
