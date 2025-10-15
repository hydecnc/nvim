-- Highlight when yanking text
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('highlight-yank', { clear = true }),
  callback = function()
    vim.hl.on_yank()
  end,
})

local layout_util_group = vim.api.nvim_create_augroup('layout-util', { clear = true })
vim.api.nvim_create_autocmd('TermClose', {
  group = layout_util_group,
  callback = function()
    if vim.v.event.status == 0 then
      local buf = vim.api.nvim_get_current_buf()
      -- Only delete if it's actually a terminal buffer
      if vim.bo[buf].buftype == 'terminal' then
        vim.api.nvim_buf_delete(buf, {})
      end
    end
  end,
})

-- Disable line numbers in terminal
vim.api.nvim_create_autocmd('TermOpen', {
  group = layout_util_group,
  callback = function()
    vim.opt_local.number = false
    vim.opt_local.relativenumber = false
    vim.opt_local.signcolumn = 'no'
  end,
})

-- Auto-resize splits when window is resized
vim.api.nvim_create_autocmd('VimResized', {
  group = layout_util_group,
  callback = function()
    vim.cmd 'tabdo wincmd ='
  end,
})
