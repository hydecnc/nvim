return {
  {
    'snacks.nvim',
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
