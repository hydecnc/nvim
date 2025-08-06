return {
  {
    'folke/snacks.nvim',
    priority = 1000,
    lazy = false,
    opts = {
      bigfile = { enabled = true },
      bufdelete = { enabled = true },
      indent = { enabled = true },
      input = { enabled = false },
      lazygit = { enabled = false },
      notifier = { enabled = true },
      quickfile = { enabled = true },
      scope = { enabled = true },
      scroll = { enabled = true },
      statuscolumn = { enabled = true },
      terminal = { enabled = true },
      win = { enabled = true },
      words = { enabled = true },
      styles = {
        split = {
          position = 'bottom',
          height = 0.3,
          width = 0.4,
        },
      },
      zen = { enabled = false },
    },
    -- stylua: ignore
    keys = {
      {
        '<leader>n',
        function()
          if Snacks.config.picker and Snacks.config.picker.enabled then
            Snacks.picker.notifications()
          else
            Snacks.notifier.show_history()
          end
        end,
        desc = 'Notification History',
      },
    },
  },
  -- Import other parts of the plugin
  require 'plugins.snacks.picker',
  require 'plugins.snacks.explorer',
  require 'plugins.snacks.terminal',
}
