-- Highlight when yanking text
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('highlight-yank', { clear = true }),
  callback = function()
    vim.hl.on_yank()
  end,
})

local layout_util_group = vim.api.nvim_create_augroup('custom-terminal', { clear = true })

-- Disable line numbers in terminal
vim.api.nvim_create_autocmd('TermOpen', {
  group = layout_util_group,
  callback = function()
    vim.opt.spell = false
  end,
})
