-- Highlight when yanking text
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('highlight-yank', { clear = true }),
  callback = function()
    vim.hl.on_yank()
  end,
})

-- Disable line numbers in terminal
vim.api.nvim_create_autocmd('TermOpen', {
  group = vim.api.nvim_create_augroup('custom-terminal', { clear = true }),
  callback = function()
    vim.opt.spell = false
  end,
})

-- Auto-resize splits when window is resized
vim.api.nvim_create_autocmd('VimResized', {
  group = vim.api.nvim_create_augroup('resize-splits', { clear = true }),
  callback = function()
    vim.cmd 'tabdo wincmd ='
  end,
})
