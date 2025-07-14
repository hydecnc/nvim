return {
  {
    'snacks.nvim',
    dependencies = {
      'nvim-tree/nvim-web-devicons',
    },
    opts = {
      terminal = {
        enabled = true,
      },
    },
    keys = {
      {
        '<leader>ft',
        function()
          Snacks.terminal()
        end,
        desc = 'Terminal (cwd)',
      },
      { '<C-/>', '<leader>ft', desc = 'Terminal (cwd)', remap = true },
    },
  },
}
