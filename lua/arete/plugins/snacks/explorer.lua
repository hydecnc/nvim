return {
  {
    'snacks.nvim',
    dependencies = {
      'nvim-tree/nvim-web-devicons',
    },
    opts = {
      explorer = {
        enabled = true,
        -- config = {
        --   replace_netrw = true, -- Replace netrw with the snacks explorer
        -- },
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
