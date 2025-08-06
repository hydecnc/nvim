return {
  {
    'snacks.nvim',
    opts = {
      explorer = {
        enabled = true,
        replace_netrw = true, -- Replace netrw with the snacks explorer
      },
    },
    keys = {
      {
        '<leader>fe',
        function()
          Snacks.explorer {}
        end,
        desc = 'Explorer Snacks (cwd)',
      },
      { '<leader>e', '<leader>fe', desc = 'Explorer Snacks (cwd)', remap = true },
    },
  },
}
