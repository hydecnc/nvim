vim.api.nvim_create_user_command('FormatDisable', function(args)
  if args.bang then
    -- FormatDisable! will disable formatting just for this buffer
    vim.b.disable_autoformat = true
  else
    vim.g.disable_autoformat = true
  end
end, {
  desc = 'Disable autoformat-on-save',
  bang = true,
})

vim.api.nvim_create_user_command('FormatEnable', function()
  vim.b.disable_autoformat = false
  vim.g.disable_autoformat = false
end, {
  desc = 'Re-enable autoformat-on-save',
})

-- Add commands to toggle formatting
vim.api.nvim_create_user_command('ToggleFormat', function()
  vim.b.disable_autoformat = not vim.b.disable_autoformat
  vim.g.disable_autoformat = not vim.g.disable_autoformat
end, {
  desc = 'Toggle autoformat-on-save',
})
